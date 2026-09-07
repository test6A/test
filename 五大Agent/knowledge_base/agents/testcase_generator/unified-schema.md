# 标准测试用例统一字段契约

## 1. 统一目标
本仓库的标准测试用例允许同时存在 CSV、Markdown、JSON 三种载体，但三者必须共享同一套语义。

统一原则：
- JSON 是机器主契约，也是后续脚本生成和执行汇总的真相源。
- Markdown 是人工审阅层，内容必须与 JSON 关键语义一致。
- CSV 只分为两种角色：历史样例、统一模板。历史样例不等于字段契约。

## 2. 推荐字段总表
| 统一语义 | JSON 字段 | Markdown 表达 | CSV 统一模板列 | 必填 | 说明 |
| --- | --- | --- | --- | --- | --- |
| 用例编号 | tcId | 标题中的 TC_xxx | tcId | 是 | 一条用例的稳定唯一标识 |
| 来源测试点序号 | sourcePointId | 可不显式展示 | sourcePointId | 是 | 直接对应原始测试点编号 |
| 页面 | page | 标题或说明中体现 | page | 是 | 页面级归属，如申请列表页 |
| 模块 | module | 标题或说明中体现 | module | 是 | 页面下的子模块，如搜索框 / Request Name |
| 用例标题 | title | 标题中的中文标题 | title | 是 | 不包含 tcId 的语义标题 |
| 优先级 | priority | 可不显式展示 | priority | 是 | 如 P0/P1/P2 |
| 用例类型 | caseType | 可不显式展示 | caseType | 否 | 如 功能用例/异常用例 |
| 前置条件 | preconditions | 前置条件 | preconditions | 是 | 建议为数组；CSV 中为多行文本 |
| 操作步骤 | steps | 操作步骤 | steps | 是 | 建议为数组；CSV 中为多行文本 |
| 预期结果 | expected | 预期结果 | expected | 是 | 建议为数组；CSV 中为多行文本 |
| 自动化标签 | automationTags | 可不显式展示 | automationTags | 是 | 如 ui, smoke, boundary |
| 批次名 | batchName | 文档标题或说明中体现 | batchName | 是 | 用于归档与批量生成 |
| 来源原始标题 | sourceTitle | 可不显式展示 | sourceTitle | 否 | 保留原测试点标题，便于追溯 |
| 来源原始模块 | sourceModule | 可不显式展示 | sourceModule | 否 | 保留输入中的原始模块文本 |
| 备注 | notes | 可附在说明中 | notes | 否 | 记录限制、假设、实现备注 |

## 3. 必填规则
标准链路最少依赖以下字段：
- tcId
- sourcePointId
- page
- module
- title
- priority
- preconditions
- steps
- expected
- automationTags
- batchName

说明：
- caseType 是兼容历史 CSV 的推荐字段，但不是当前链路硬依赖字段。
- 如果输入缺少 caseType，不阻塞后续脚本生成与执行汇总。

## 4. CSV 到 JSON 的映射
历史 CSV 样例字段与统一语义的关系如下：

| 历史 CSV 列 | 统一语义 | 说明 |
| --- | --- | --- |
| 模块 | sourceModule | 原文保留 |
| 用例名称 | sourceTitle/title | 若格式中包含前缀，可拆成 title |
| 用例分级 | priority | 直接映射 |
| 用例类型 | caseType | 直接映射到可选字段 |
| 前置条件 | preconditions | 建议拆成数组 |
| 执行步骤 | steps | 建议拆成数组 |
| 预期结果 | expected | 建议拆成数组 |

额外补齐规则：
- page 和 module 需要按当前项目语义补齐，不建议完全依赖历史 CSV 的单列“模块”。
- tcId、sourcePointId、automationTags、batchName 需要在标准化过程中补齐。
- tcId、sourcePointId 的补齐与标准化规则统一遵循 id-naming-convention.md。

## 5. Markdown 与 JSON 的关系
Markdown 允许更适合人阅读，但必须满足：
- 标题中的 tcId 与 JSON 一致。
- 标题中的语义标题与 JSON title 一致。
- 前置条件、步骤、预期结果与 JSON 对应字段一致。
- 不得在 Markdown 中引入 JSON 没有的核心断言，除非同步回写 JSON。

## 6. 数组字段约定
推荐 JSON 结构：
- preconditions: string[]
- steps: string[]
- expected: string[]
- automationTags: string[]

CSV 中这些字段建议使用多行单元格表示；Markdown 中自然使用列表表示。

## 7. page 与 module 的拆分规则
- page：页面或主场景层级，例如 申请列表页、订单详情页。
- module：页面内部的业务子区域或控件主题，例如 搜索框 / Request Name、列表 / 状态卡片。
- 如果原始测试点只有一个“模块”文本，不要机械平移到 module；应结合标题和上下文拆成 page + module。

## 8. 稳定性要求
任何新生成、重写、补齐、批量拆分的测试用例，都必须先对齐本文件，再输出 Markdown、JSON 或 CSV。

## 9. ID 生成要求
- 若输入已提供合法 tcId、sourcePointId，优先保留。
- 若 sourcePointId 缺失，必须按 id-naming-convention.md 先生成 sourcePointId。
- 若 tcId 缺失，必须基于 sourcePointId、场景类型与变体号生成 tcId。
- 若一个原始测试点拆成多条用例，所有拆分 case 必须共享同一个 sourcePointId，并用不同 tcId 变体号区分。
