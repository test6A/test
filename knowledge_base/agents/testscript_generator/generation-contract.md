# 测试脚本生成细则

## 1. 输入优先级
- 输入源是标准测试用例。
- 当同时提供 Markdown 与 JSON 时，优先解析 JSON。
- Markdown 仅用于辅助理解业务语境、校验标题和步骤表达。
- 若 MD 与 JSON 不一致，默认以 JSON 为准；只有 JSON 缺字段或损坏时，才回退参考 MD。
- 若 testcase 知识库中存在统一字段契约，必须按统一字段契约理解 JSON、Markdown、CSV 的语义，不得自行臆测字段含义。

### 1.1 范围判定优先级
- 若输入是整份 testcase JSON/Markdown 文件，且用户未显式指定 tcId、sourcePointId、标题关键词、模块过滤或“只生成一条/只生成示例”，则脚本生成范围默认是该文件内全部测试用例。
- “单页面功能测试”“编辑页/详情页”“列表页功能”这类表述默认只限定场景类型，不构成单条用例过滤条件。
- 若用户要求“立即执行”，默认含义是“先生成范围内全部脚本，再执行指定范围”；不能把“立即执行”解释为“只先生成一条”。
- 只有在用户显式指定唯一用例或显式要求先做一条验证时，才允许退化为单条脚本生成。

推荐先读取：
- .github/knowledge_base/agents/testcase_generator/unified-schema.md
- .github/knowledge_base/agents/testcase_generator/id-naming-convention.md

## 2. 一对一映射
- 1 条测试用例只能生成 1 个独立 test()。
- test() 内必须用 test.step() 组织步骤。
- 输入步骤必须全量覆盖，不得遗漏。

脚本生成侧至少依赖以下 testcase 字段：
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

若 testcase JSON 中存在 caseType、sourceTitle、sourceModule、notes 等扩展字段，可保留并按需用于注释、元数据或附件，但不得覆盖主契约字段。

若 testcase 输入缺少 tcId 或 sourcePointId：
- 不要因为缺字段直接中止脚本生成。
- 必须先按 id-naming-convention.md 自动补齐，再继续生成脚本。
- 同一条用例在脚本标题、日志、失败报告里的 tcId、sourcePointId 必须保持一致。

## 3. 报告契约
每条测试失败时，必须可还原：
- tcId
- sourcePointId
- blockedStage
- reason
- expected
- actual
- pageUrl

推荐错误信息格式：
TC_ID=xxx | SOURCE_POINT_ID=xxx | BLOCKED_STAGE=xxx | REASON=xxx | EXPECTED=xxx | ACTUAL=xxx | PAGE_URL=xxx

若仓库已有附件 helper 或 testInfo.attach 能力，优先保留：
- 失败摘要文本
- 字段差异明细
- 失败截图
- 当前页面地址

## 4. 多文件输出
- 当输入用例很多时，默认仍应一次性输出完整 spec 文件集合。
- 允许内部拆分为多个 spec，但不要要求用户分多轮对话继续追问下一批。
- 单个 spec 默认承载 20 到 30 条用例，这是单文件组织建议，不是多轮输入要求。
- 若输入为整份用例文件，输出说明中必须明确写出“本次已覆盖的总用例数、拆分后的 spec 数量、每个 spec 对应的 tcId 范围或模块范围”。

### 4.1 可执行性要求
- 当用户明确要求“全部可执行”“直接执行”“生成后验证跑通”时，输出的每个 test() 必须是面向当前环境可真实运行的正式实现。
- 禁止使用 `test.fixme()`、`test.skip()`、空 test、占位 helper、伪造断言、仅文件存在但无法完成业务动作的骨架代码来冒充“已生成脚本”。
- 如果发现部分用例因环境、权限、入口、样本数据、通知链路或审批角色缺失而暂时无法落成真实可执行脚本，必须先中止生成并返回阻塞清单，而不是混合输出“可执行脚本 + 占位脚本”。
- 只有当用户显式要求“先生成脚手架”“先占位后补实现”“先覆盖文件结构”时，才允许生成不可执行或部分不可执行的占位脚本。

## 5. spec 拆分规则
- 拆分顺序优先按 页面 -> 模块 -> 功能主题。
- 同一 spec 内尽量共享页面恢复与 helper。
- 不能为了共享流程破坏 1 用例 = 1 test 的映射。

## 6. 文件命名规则
- 文件名必须语义化，要求看到文件名就知道测试哪些功能点。
- 推荐格式：
  - <page>-<module>-<feature>.spec.js
  - <page>-<module>-<feature>-batch-01.spec.js
- 例如：
  - request-list-search-request-name.spec.js
  - request-list-search-traveler.spec.js
  - request-list-search-request-no.spec.js
- 禁止：
  - test1.spec.js
  - auto-generated-01.spec.js
  - final-case.spec.js

## 7. 通用工程规则
- 优先复用当前仓库的 helper、page action、scenario 或模板化组织方式。
- 非脚本问题导致的失败，不要通过放宽断言或 serial 中断来掩盖。
- 若需要提交后回查数据，必须按本次提交主键回捞，不能按最新一行兜底。

## 8. 价格/复杂模板场景的附加规则
仅在场景涉及价格计算、渠道模板、共享 actionSequence、多阶段编辑页时启用：
- 多个价格因子验证可共用同一编辑页继续操作。
- 共享改动优先落在共享 action、共享场景或基础模板层。
- 新增产品仅为支撑后续动作时，优先设计阶段化产品选择策略，不要把所有步骤粗暴放大成 all。
- 渠道前缀属于模板变体层，不要写死到基础标题。

## 9. 控制权分配
- Playwright 负责：页面导航、状态等待、关键交互、严格数值断言、业务公式校验。
- Midscene 负责：弱结构提取、视觉补充断言、低风险兜底动作。
- 禁止：
  - 用 aiAction 接管关键恢复主链路。
  - 用 aiAssert 代替严格数值校验。
  - 让 AI 代算业务公式。

## 10. CDP 与导入约束
- 正式脚本位于 projects/<project-name>/tests/ 下时，固定导入：
  import { test, expect } from '../../../cdp-fixture.js';
- 禁止使用 @playwright/test 作为正式脚本入口。
- 禁止在脚本内编写 chromium.connectOverCDP()。
- 需要 AI 方法时才导入 PlaywrightAgent。
- 一个 test 块内 new PlaywrightAgent(page) 只能出现一次。

## 11. 韧性与断言
- 优先用 Playwright auto-retry，不要无意义包裹 try-catch。
- 关键操作前先等待业务状态，禁止硬编码 page.waitForTimeout。
- 关键字段读取后必须做类型转换与合法性校验。
- 页面重渲染后必须重取 locator，不要盯旧句柄轮询。
- 多字段校验优先 expect.soft()；但关键前置条件失败可立即硬失败。
- 每条用例都要明确 blockedStage，例如：precondition、open-page、locate、input、select、search、submit、assert、cleanup。

## 12. 最终输出要求
- 若只生成 1 个 spec，可输出 1 个代码块。
- 若生成多个 spec，必须在同一次回复中输出全部代码块。
- 每个代码块第一行必须标注保存路径。
- 输出必须是可执行脚本，不得是伪代码或半成品。
- 若因为环境阻塞而无法满足“全部可执行”，最终输出不得伪装成完成态；必须显式改为“阻塞分析 + 前置条件缺口 + 建议补充数据/账号/入口”，等待用户确认后再继续。
