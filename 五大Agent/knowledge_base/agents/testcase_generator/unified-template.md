# 标准测试用例 Markdown 统一模板

文档级说明建议：
- 批次覆盖范围
- 本批次边界
- 对应原始测试点序号范围

每条用例使用以下结构：

## TC_xxx: 用例标题
- **前置条件**:
  1. 条件一
  2. 条件二
- **操作步骤**:
  1. 步骤一
  2. 步骤二
- **预期结果**:
  1. 结果一
  2. 结果二

要求：
- 标题中的 TC_xxx 对应 JSON 的 tcId。
- 标题中的“用例标题”对应 JSON 的 title。
- 前置条件、操作步骤、预期结果必须与 JSON 的 preconditions、steps、expected 等价。
- 若 Markdown 省略 priority、automationTags、batchName、sourcePointId 等机器字段，JSON 中仍必须完整保留。
