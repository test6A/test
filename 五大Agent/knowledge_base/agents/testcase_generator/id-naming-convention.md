# tcId 与 sourcePointId 命名规范

## 1. 目标
- 为测试用例生成 Agent 与脚本生成 Agent 提供统一、稳定、可追溯的 ID 生成规则。
- 当输入中缺少 tcId 或 sourcePointId 时，Agent 必须先按本规范补齐，再继续生成测试用例或脚本。
- 当输入已提供合法 ID 时，优先保留，不得无故重写。

## 2. 总原则
- 仅使用大写英文字母、数字和连字符 `-`。
- 不把环境、执行账号、人名、商机号、单据号、日期时间戳写入 ID。
- sourcePointId 标识原始测试点，强调稳定；tcId 标识具体测试用例，允许一个测试点拆成多条 case。
- 同一原始测试点拆成多条用例时，sourcePointId 保持不变，tcId 只变化场景类型或变体号。

## 3. 推荐格式

### 3.1 sourcePointId
格式：`SP-<PROJECT>-<PAGE>-<FUNCTION>-<SEQ>`

说明：
- `SP`：固定前缀，表示 Source Point。
- `PROJECT`：项目缩写。
- `PAGE`：页面域缩写。
- `FUNCTION`：功能域缩写。
- `SEQ`：三位序号，如 `001`。

示例：
- `SP-ECPA-FLOW-SUBMIT-001`
- `SP-ECPA-LIST-SEARCH-101`

### 3.2 tcId
格式：`TC-<PROJECT>-<SCENE>-<PAGE>-<FUNCTION>-<SEQ>-<VARIANT>`

说明：
- `TC`：固定前缀，表示 Test Case。
- `SCENE`：场景类型缩写。
- 其余字段与 sourcePointId 对齐。
- `VARIANT`：两位变体号，如 `01`。

示例：
- `TC-ECPA-SMOKE-FLOW-SUBMIT-001-01`
- `TC-ECPA-FUNC-LIST-SEARCH-101-01`

## 4. 项目缩写
- `ECP-approval-line` -> `ECPA`
- `price-calculation` -> `PCALC`

若是新项目：
- 优先使用 4 到 6 位大写英文缩写。
- 若用户已明确给出项目缩写，直接沿用。
- 若无法判断，先根据项目目录名生成一个语义化缩写，不要退化成随机字母。

## 5. 页面域缩写
- `FLOW`：流程链路
- `LIST`：列表页
- `FORM`：表单页
- `EDIT`：编辑页
- `DETAIL`：详情页
- `APPROVAL`：审批页
- `POPUP`：弹窗
- `SEARCH`：搜索区

推断规则：
- 优先取用户显式提供的 page 语义。
- 若 page 缺失，则从 title、module、sourceTitle 中提取最直接的页面语义。
- 无法细分时，流程链路默认 `FLOW`，页面级操作默认 `FORM` 或 `LIST`。

## 6. 功能域缩写
- `SEARCH`：搜索
- `PAGE`：分页
- `INPUT`：输入
- `LINKAGE`：字段联动
- `SUBMIT`：提交
- `APPROVE`：审批通过
- `REJECT`：驳回
- `RESUBMIT`：再次提交
- `STATUS`：状态流转
- `ASSERT`：结果校验

推断规则：
- 优先读取 title、steps、expected 中最核心的业务动作。
- 若出现多个动作，按“最主要断言对象”决定功能域，不要把多个功能混写进 ID。
- 若同一测试点包含多个隐式验证，应先拆 case，再分别命名。

## 7. 场景类型缩写
- `SMOKE`：冒烟流程
- `FUNC`：单页面功能
- `REG`：回归
- `NEG`：反向、异常、校验失败类
- `DATA`：数据一致性、对账、明细比对
- `UI`：纯界面展示或布局校验

推断优先级：
1. 用户显式指定的场景类型
2. `caseType`
3. `automationTags`
4. `title` 或 `expected` 中的关键词
5. 默认使用 `FUNC`；涉及端到端流程时默认使用 `SMOKE`

## 8. 序号与变体号生成规则

### 8.1 sourcePointId 的 `SEQ`
- 若原始测试点已带稳定编号，优先复用并格式化为三位数。
- 若输入中没有稳定编号，则按“同一项目既有用例最大序号 + 1”连续生成三位序号。
- 连续编号必须跨批次保持单调递增；同项目后续批次禁止重置到 `101`、`201` 等分段起点。
- 只有在用户明确要求“全量重排历史编号”时，才允许重排；且必须同步更新 JSON、Markdown、脚本引用三处 ID。

### 8.2 tcId 的 `VARIANT`
- 同一个 sourcePointId 拆出多条 case 时，从 `01` 开始递增。
- 未拆分时默认 `01`。

## 9. 自动补齐规则
- 若 `sourcePointId` 缺失：必须先按本规范生成 `sourcePointId`。
- 若 `tcId` 缺失：必须基于同一条用例的 `sourcePointId`、场景类型和变体号生成 `tcId`。
- 若两者都缺失：先生成 `sourcePointId`，再生成 `tcId`。
- 若同项目已存在历史用例：先扫描现有用例中的最大 `SEQ`，新用例从下一个序号继续。
- 若提供的 ID 不符合格式但语义清晰：优先做最小格式标准化；不要随意改动其核心语义。
- 若提供的 ID 与本规范完全冲突且无法稳定追溯：在输出中使用本规范重建，并在备注或说明中标明“按命名规范自动补齐”。

## 10. 当前仓库推荐基线

### 10.1 ECP 审批流
- 流程冒烟原始测试点：
  - `SP-ECPA-FLOW-SUBMIT-001`
  - `SP-ECPA-FLOW-APPROVE-002`
  - `SP-ECPA-FLOW-REJECT-003`
  - `SP-ECPA-FLOW-RESUBMIT-004`
  - `SP-ECPA-FLOW-STATUS-005`
- 单页面功能原始测试点：
  - `SP-ECPA-LIST-SEARCH-101`
  - `SP-ECPA-LIST-PAGE-102`
  - `SP-ECPA-FORM-INPUT-103`
  - `SP-ECPA-FORM-LINKAGE-104`
  - `SP-ECPA-FORM-ASSERT-105`

### 10.2 对应 tcId 示例
- `TC-ECPA-SMOKE-FLOW-SUBMIT-001-01`
- `TC-ECPA-SMOKE-FLOW-APPROVE-002-01`
- `TC-ECPA-NEG-FLOW-REJECT-003-01`
- `TC-ECPA-FUNC-LIST-SEARCH-101-01`
- `TC-ECPA-FUNC-FORM-LINKAGE-104-01`

## 11. 禁止事项
- 禁止使用中文、空格或下划线混入最终 ID。
- 禁止把环境、申请人、审批人、商机号、单据号、日期时间写进 ID。
- 禁止仅使用无语义流水号，如 `TC-001`、`SP-001`。
- 禁止在未拆分隐式多职责测试点时，直接为混合职责 case 生成含糊 ID。