# 国际ECP（订单平台UAT）报备/转下单体系 — 逆向学习笔记

> 来源：开发平台 dev-platform-cli 服务实例历史日志（oversea-op-* 系列，2026-08-26 ~ 08-29）
> 目标：支撑"重新报备 → 审批 → 转下单 → 转下单审批完成"自动化方案

## 1. 系统架构

| 层 | 组件 | 说明 |
| --- | --- | --- |
| 前端 | https://order-platform-uat.ruijie.com.cn/overseaOrderCenter/myOrdersNew | 我的订单页（SID 统一认证 CAS） |
| BFF | oversea-op-api-59ec2 | 前端主入口，RecordLogAspect 切面记录请求入参 |
| 订单核心 | oversea-op-order-b3322 | 报备单/下单单/合同/CRM 关单 |
| 审批流 | oversea-op-process-d779d | Activiti 工作流引擎封装 |
| 产品 | oversea-op-product-20cfa | 产品、组合包拆分 |
| 基础 | oversea-op-biz-6abe3 | 汇率、信用、附件 |
| 用户 | oversea-op-user-aa08c | 用户 |

系统ID（开发平台）：0e724d9869394fdaaca36a236300bcbb（订单平台系统）

## 2. 业务模型：special_offer（报备/下单单据）

实体 `OverseaOrderBaseSpecialOffer`（oversea-op-order）关键字段（来自 update 日志入参 toString）：

```
id, parentId（转下单单据指向原报备单）, code（雪花号）
bizType: 1=报备(orderType=11) / 2=下单(orderType=12) / 5=转下单产生单据(orderType=21?)
draftFlag, abandonedFlag, rejectedFlag
applicant/applicantName, deptCode/deptName
opportunityCode/opportunityName（业务机会）, projectName
endUserCompanyName（终端用户）, destination（目的国，如 Indonesia）
powerCordSpecifications（电源线规格，如 Australia）
settlementCurrency（USD）, taxRate, exchangeRate/exchangeRateToUsd/exchangeRateToCny
paymentType, accountPeriod（如 "0,100%"）
frameworkAgreementCode/Name（框架协议 FA-US-2026-004）
processStatusId/processStatusCode/processStatusName（审批状态）
approver（当前审批人账号列表，逗号分隔）
rebateFlag/rebate（返利标记）
agentFlag, distributorsFlag, acquisition, diversionFlag（渠道属性）
createBy/createTime/updateBy/updateTime
```

## 3. 审批流程（Activiti）

流程定义 key：
- `overseaSpecialOfferReport` —— 报备流程
- `overseaSpecialOfferOrder` —— 下单流程（协议价下单监听 OverseaAgreementOrderSpeciaEndListener）
- `overseaSparePartsOrder` —— 备件订单

已观察审批节点（processStatusCode）：
- `salesLeaderAudit` — To be approved by Special Offer Approval specialist（张思静等）
- `commercialAssistantAudit` — To be approved by Business Assistant（徐爱霞xuax、黎璠lifan1、林秀丽、方倩、李凯西）
- `ordererAudit` — To be approved by order executor（张淑娇等）

审批动作协议：
- claim-task：`{"taskId":"2093260430167379969","assignee":"zhoujingjing"}`（审批人先领取任务）
- pass-task：taskId + `{auditFlag=true, reason=通过}`（内部 completeTask）
- 提交单据也是 completeTask：`{reason=提交}`

流程结束：is-finish-process-new → 监听器触发 → CRM 关单（notification-crm-close-order）→ 合同回调（handle-contract-num / handle-erp-order-num）

## 4. API 地图

### BFF（oversea-op-api，前端入口，带 RecordLogAspect 入参日志）
- `POST /oversea-op-api/api/v1/oversea/special_offer/list` — 查询海外报备/下单列表
  - 入参：`{"pageNum":1,"pageSize":10,"bizType":1|2|3,"listType":1,"userId":"xuax","projectName":"","applicantName":"","contractNo":"","opportunityNumber":"","poNumber":"","customer":"","customerVad":""}`
- `POST /oversea-op-api/api/v1/oversea/special_offer/getPriceTaxData` — 协助前端计算关税、财税、产品出货价
- `GET /oversea-op-api/api/v1/oversea/special_offer/checkIsOverseaOrderByCode` — 回调ECP是否走国际服务

### 订单服务（oversea-op-order）
- `POST /oversea-op-order/special_offer/save-oversea-order-special-report` — 保存报备/下单单
  - 内部链：saveOrderOpportunity（业务机会）→ saveChannelInformation（渠道信息+orderAgentRelation代理关系）→ addOrderAgentRelation（agentId/agentName/agentParticipationTypeId/totalPrice/totalDiscount）→ saveOverSeaProduct（产品行）→ saveOverseaOrderSplitProductInfoExtend（拆分扩展表，orderType=11 时跳过）
- `POST /oversea-op-order/special_offer/update-oversea-order-special-report` — 更新报备/下单（审批状态回写）
- `POST /oversea-op-order/contract/generate-contract` — 生成合同（调 CES）
- `POST /oversea-op-order/contract/handle-contract-num` — CES 合同号回调
- `POST /oversea-op-order/contract/handle-contract-state` — 合同状态回调
- `POST /oversea-op-order/contract/handle-erp-order-num` — ERP 订单号回调
- `POST /oversea-op-order/crm/notification-crm-close-order` — CRM 关单
- `GET /oversea-op-order/order-product-info/get-product-infos` — 查询拆分前产品基础数据
- `POST /oversea-op-order/order-product-extend/batchGetByOrderProductIds` / `batchGetBySplitProductIds`

### 流程服务（oversea-op-process）
- `POST /oversea-op-process/process/start-process-by-key` — 启动流程
  - 入参：`{"processDefinitionKey":"overseaSpecialOfferOrder","businessKey":"<单据id>"}`
- `POST /oversea-op-process/process/claim-task` — 领取任务 `{"taskId":"...","assignee":"..."}`
- `POST /oversea-op-process/process/pass-task` — 审核通过 `{"taskId":"...","auditFlag":true,"reason":"通过"}`
- `POST /oversea-op-process/process/query-to-do-list` — 待办列表（入参含流程定义key）
- `POST /oversea-op-process/process/get-tasks-by-businessKey-definitionKey` — 按业务id+流程key查审核历史
- `POST /oversea-op-process/process/get-task-by-process-instance-id` — 按流程实例+审批人获取 taskId
- `POST /oversea-op-process/process/get-process-by-biz-id` — 按业务id查流程
- `POST /oversea-op-process/process/is-finish-process-new` — 流程是否结束
- `POST /oversea-op-process/process/current-act-info` / `current-acts-info-parallel` — 当前节点
- `POST /oversea-op-process/process/set-process-params` — 设置流程参数
- `GET /oversea-op-process/process/get-variables` — 历史审批参数
- `POST /oversea-op-process/process/get-assignee-role` / `get-approval-process` / `get-audit-list`

### 产品/基础（oversea-op-product / oversea-op-biz）
- `POST /oversea-op-product/product/list-product` — 产品列表（deptCode/discount等过滤）
- `POST /oversea-op-product/product/product-package-split` — 组合包拆分
- `POST /oversea-op-product/product/product-package-split-for-agreement`
- `POST /oversea-op-product/product/overseaProductServiceEcho`
- `POST /oversea-op-biz/bj/exchange-rates` — 汇率
- `GET /oversea-op-biz/sales-credit/creditRating` — 信用评级
- `GET /oversea-op-biz/attachment/attachments` — 附件列表
- `POST /oversea-op-biz/bj/region-powercords` — 区域电源线

## 5. 观察到的完整时序样例（单据 45806，2026-08-28）

1. 16:50:04 创建（createBy=langyuemei，bizType=5，parentId=45788，code=1542939335446237184）
2. 16:50:45 update（processStatusCode=commercialAssistantAudit，approver=xuax,lifan1,linxiuli,fangqian）
3. 16:52:00 / 16:52:33 update（状态推进）
4. 16:54:50 claim-task（assignee=zhoujingjing 领取 taskId=2093260430167379969）
5. 16:54:52 pass-task（auditFlag=true, reason=通过）
6. 16:54:52 is-finish-process-new → 流程结束 → OverseaAgreementOrderSpeciaEndListener（orderType=21）→ CRM 关单
7. 16:54:52 handle-erp-order-num（ERP 单号回调，operator=zhoujingjing）

另一样例（45791，bizType=2 下单）：save 时 saveChannelInformation + addOrderAgentRelation（agentId=HW202504117775 "SKE ENERGY" MCHJ，agentParticipationTypeId=7，totalPrice=8800，totalDiscount=106.81）

## 6. 目标自动化流程（用户确认）

原已报备完成的报备单（bizType=1，流程 overseaSpecialOfferReport 已结束）：
1. **重新报备**：列表找到原报备单 → 点"重新报备"（前端行为待登录确认，推测复制原单生成新报备单并重新走流程）
2. **报备审批**：新报备单走 salesLeaderAudit → commercialAssistantAudit（→ ordererAudit?）直到流程结束
3. **转下单**：新报备完成单上点"转下单"（生成 bizType=2/5 单据，parentId 指向报备单，启动 overseaSpecialOfferOrder 流程）
4. **转下单审批**：claim → pass 直到流程结束（触发合同/ERP/CRM）

## 7. 认证与执行通道（待补）

- 页面登录：SID 统一认证（CAS），用户手动登录后 state-save 保存登录态
- API 执行通道（待登录后确认）：前端 nginx 将 /oversea-op-xxx/* 直接转发到微服务；请求头中的用户身份载体待抓包确认（大概率是 cookie 或网关注入的用户头）
