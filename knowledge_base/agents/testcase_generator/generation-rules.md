# 测试用例生成细则

## 1. 定位
- 目标是把评审通过的测试点转成标准测试用例，供脚本生成与执行汇总使用。
- 默认是无损转化加结构化展开，不主动扩业务范围。
- 只有用户明确要求“补充遗漏 / 查漏补缺 / Review 补足”时，才允许新增补充用例。

## 2. 统一原则
- 必须统一语义，不要求 CSV、Markdown、JSON 三种载体长得完全一样。
- JSON 是唯一机器主契约，也是后续脚本生成与执行汇总的真相源。
- Markdown 是给人审阅的展示层，必须与 JSON 语义一致。
- CSV 分为两类：
  - 历史样例：用于学习团队写法，不作为字段契约。
  - 统一模板：用于表格化查看或导入导出，字段语义必须与 JSON 对齐。

## 3. 当前知识库角色
- 历史风格样例：.github/knowledge_base/agents/testcase_generator/差旅申请列表+审批+邮件.csv
- 统一字段与映射：.github/knowledge_base/agents/testcase_generator/unified-schema.md
- 统一 ID 命名：.github/knowledge_base/agents/testcase_generator/id-naming-convention.md
- 统一 Markdown 模板：.github/knowledge_base/agents/testcase_generator/unified-template.md
- 统一 CSV 模板：.github/knowledge_base/agents/testcase_generator/unified-template.csv

规则：
- 学“写法”看历史样例。
- 定“字段”和“映射”看 unified-schema.md。
- 产出文件时按 unified-template.md 和 unified-template.csv 的语义执行。

## 4. 核心映射
- 1 个测试点至少生成 1 条测试用例。
- 一个测试点含多个隐式验证时，必须拆分为多条用例。
- 自动化链路下禁止把“步骤相同但断言不同”的用例合并。

## 5. 产物要求
- 同一次任务同时产出 Markdown 和 JSON 两份等价内容。
- Markdown 给人审阅。
- JSON 给脚本生成器与执行汇总工具消费。
- 当后续脚本生成同时收到 MD 和 JSON 时，以 JSON 为准，MD 只作辅助说明。
- 两份文件的 tcId、sourcePointId、title、steps、expected 等关键字段必须语义一致。

## 6. JSON 主契约
JSON 每条用例至少包含：
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

可选扩展字段：
- caseType
- sourceTitle
- sourceModule
- notes

说明：
- sourcePointId 必须直接对应原始测试点序号。
- preconditions、steps、expected、automationTags 建议使用数组。
- 若历史来源中存在“用例类型”，统一映射到可选字段 caseType；不要因为旧 CSV 有该列就打破现有主链路。
- 若原始输入未显式给出 tcId 或 sourcePointId，必须按 id-naming-convention.md 自动补齐，不得留空。

## 6.1 编号连续性
- 同一项目内，测试用例三位序号必须连续增长，不因分批生成而重新起号。
- 生成新批次前，先读取该项目已有 JSON 主契约，获取当前最大序号，再从下一号继续。
- 若用户明确要求重排历史编号，必须执行“全链路同步改号”：JSON、Markdown、脚本引用中的 tcId/sourcePointId 一并更新。
- 默认禁止“入口批次用 101 段、明细批次用 201 段”的分段策略，除非用户明确指定保留该历史策略。

## 7. Markdown 结构
每条用例结构如下：
- 标题：TC_用例编号: 用例标题
- 前置条件
- 操作步骤
- 预期结果

说明：
- Markdown 允许省略 automationTags、batchName 等机器消费字段的显式展示。
- 但凡 Markdown 中出现的 tcId、title、steps、expected，不得与 JSON 冲突。

## 8. 大规模输入
- 当输入为 100 条、200 条或更多测试点时，默认仍应一次性接收、一次性完整产出。
- 允许内部按“页面 -> 模块 -> 功能点”分文件组织，但必须在同一次任务里完整输出全部文件。
- 只有在明确遇到模型或上下文长度极限时，才建议继续拆分输入。

## 9. 保存路径
- 默认保存到：projects/<project-name>/docs/testcases/
- 若用户明确指定项目名，保存到对应项目。
- 若未指定但可从上下文判断归属项目，可自动归档。
- 若仍无法判断，必须先询问项目名。

## 10. 文件命名
- 文件名必须语义化，要求看到文件名就知道覆盖的页面、模块、功能点。
- 推荐格式：
  - request-list-search-request-name.md
  - request-list-search-request-name.json
  - order-center-myapply-status-flow.md
- 同一主题内容过多时，再追加 batch 后缀：
  - request-list-search-request-name-batch-01.md
  - request-list-search-request-name-batch-02.json
- 禁止无语义随机名称：
  - test-1.md
  - batch-a.json
  - case-output-final.md

## 11. 收尾自检
生成后必须自检：
- 是否 100% 覆盖输入测试点。
- 是否遗漏隐式多职责测试点拆分。
- 若用户要求无损转化，是否避免了额外业务发散。
- 若用户要求查漏补缺，补充项是否与原用例清晰区分。
- Markdown 与 JSON 是否字段一致、命名一致、文件清单完整。
- 若需要导出 CSV，导出的字段语义是否与 unified-schema.md 一致。
- tcId、sourcePointId 是否已补齐，且命名是否符合 id-naming-convention.md。
