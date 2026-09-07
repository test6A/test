# Skills 导出总览

> 导出时间：2026-08-29
> 源目录：`C:\Users\admin\.agents\skills\`（lark-cli 全部 27 个 skill 源文件）
> 导出位置：`d:\ai_lab\skills-export\`
> 每个 skill 的核心是 `SKILL.md`（主指令文档），细节参考在 `references/` 子目录

## 一、飞书生态 Skill（lark-*，共 27 个）

### 消息与协作

| Skill | 版本 | 文件数 | 用途 | CLI 入口 |
|---|---|---|---|---|
| lark-im | 1.x | 59 | 即时通讯：收发消息、群聊管理、表情回复、交互卡片、加急、聊天记录搜索 | `lark-cli im --help` |
| lark-mail | 1.x | 34 | 邮箱：起草/发送/搜索邮件、监听新邮件、收信规则 | `lark-cli mail --help` |
| lark-calendar | 1.0.0 | 11 | 日历：日程增删改查、忙闲查询、会议室预定 | `lark-cli calendar --help` |
| lark-contact | 1.x | - | 通讯录：姓名/邮箱 ↔ open_id 解析、查同事资料、搜机器人 | `lark-cli contact --help` |
| lark-event | 1.x | - | 实时事件流：NDJSON 订阅消费（消息/审批/会议/白板等事件） | `lark-cli event consume <EventKey>` |

### 文档与内容

| Skill | 版本 | 文件数 | 用途 | CLI 入口 |
|---|---|---|---|---|
| lark-doc | 1.x | 44 | 云文档（Docx/Wiki）内容读写、图片附件、思维笔记 | `lark-cli doc --help` |
| lark-sheets | 1.x | 27 | 电子表格：结构管理、单元格读写、图表、透视表、金融建模 | `lark-cli sheets --help` |
| lark-base | 1.2.4 | 30 | 多维表格：建表、字段、视图、表单、仪表盘、workflow | `lark-cli base --help` |
| lark-drive | 1.x | 61 | 云空间：文件上传下载、目录整理、权限、版本、导入转换 | `lark-cli drive --help` |
| lark-wiki | 1.0.3 | 14 | 知识库：知识空间、节点层级、成员管理 | `lark-cli wiki --help` |
| lark-slides | 1.x | 50 | 幻灯片：创建/读取/局部替换页面 | `lark-cli slides --help` |
| lark-whiteboard | 1.x | 31 | 画板：导出图片/节点结构、多格式更新内容 | `lark-cli whiteboard --help` |
| lark-markdown | 1.x | - | Markdown 文件：查看、创建、编辑、patch、diff | `lark-cli markdown --help` |

### 会议

| Skill | 版本 | 文件数 | 用途 | CLI 入口 |
|---|---|---|---|---|
| lark-vc | 1.0.0 | - | 视频会议：进行中会议、会中实时内容、历史会议、纪要、参会人快照 | `lark-cli vc --help` |
| lark-vc-agent | 1.0.0 | - | 会议会中能力：机器人真实入会/离会、读会中事件、发会中消息 | `lark-cli vc --help` |
| lark-minutes | 1.x | 10 | 妙记：搜索、纪要产物读写、说话人替换、音视频转写 | `lark-cli minutes --help` |
| lark-note | 1.x | - | 会议纪要直查（已知 note_id）：详情、原始逐字稿 | `lark-cli note --help` |

### 工作流

| Skill | 版本 | 用途 | CLI 入口 |
|---|---|---|---|
| lark-approval | 1.2.0 | 审批：待办/已办/实例查询处理、发起原生审批 | `lark-cli approval --help` |
| lark-task | 1.x | 任务：待办创建、状态更新、子任务、清单、任务智能体 | `lark-cli task --help` |
| lark-okr | 1.x | OKR：周期、目标、关键结果、对齐关系、进展记录 | `lark-cli okr --help` |
| lark-attendance | 1.0.0 | 考勤：查自己的打卡记录 | `lark-cli attendance --help` |
| lark-apps | 1.0.0 | 妙搭（Spark/Miaoda）：全栈应用开发、部署发布、日志监控、自动化触发器 | `lark-cli apps --help` |
| lark-workflow-meeting-summary | 1.0.0 | 工作流：汇总时间范围内的会议纪要生成报告 | 编排 vc/minutes/calendar |
| lark-workflow-standup-report | 1.0.0 | 工作流：calendar + task 生成日程待办摘要 | 编排 calendar/task |

### 基础设施

| Skill | 用途 | CLI 入口 |
|---|---|---|
| lark-shared | 共享规则：认证（auth login/status/logout）、身份（user/bot）、scope 权限、JSON 输出契约、安全规则。**所有 skill 的公共依赖，写 skill 前必读** | `lark-cli auth status` |
| lark-openapi-explorer | 原生 OpenAPI 探索：现有 skill 不覆盖时挖掘飞书原生接口 | `lark-cli schema <service>.<resource>.<method>` |
| lark-skill-maker | 自定义 Skill 制作器：把飞书 API 封装成可复用 Skill | 交互式向导 |

## 二、CodeBuddy 平台 Skill（不在本目录，随 IDE/插件分发）

| Skill | 来源 | 用途 |
|---|---|---|
| demo-dev-platform | user | B 公司开发平台（Demo 演示环境）：DevOps 全流程 |
| ruijie-dev-platform | user | 锐捷开发平台：系统/服务/中间件/数据库/域名/监控、流水线构建、部署发布、Pod 日志 |
| 多模态内容生成 | manager | 文生视频/图生视频/文生图/文生3D/图生3D、图片视频特效 |
| lsp-code-analysis | manager | LSP 语义代码分析：定义/引用/调用层级/重构预览 |
| skill-creator | manager | CodeBuddy 官方 skill 创建指南 |
| pptx | plugin | PowerPoint 文件读写（创建/解析/编辑 .pptx） |
| pdf | plugin | PDF 全操作（读取/合并/拆分/水印/表单/OCR） |
| docx | plugin | Word 文档读写（创建/编辑/样式/目录/替换） |
| xlsx | plugin | Excel/CSV 读写（公式/图表/格式/数据清洗） |
| agent-browser | plugin | 浏览器自动化（开源 vercel-labs/agent-browser CLI） |
| playwright-cli | plugin | Playwright 浏览器自动化（网页测试/表单/截图/数据提取） |
| find-skills | plugin | 发现并安装新 skill |

## 三、学习写 Skill 的建议路径

1. **入门范例**（结构最简单，适合模仿）：
   - `lark-attendance/SKILL.md` —— 单一功能 skill
   - `lark-workflow-standup-report/SKILL.md` —— 多 skill 编排
2. **进阶范例**（完整工程结构）：
   - `lark-contact/SKILL.md` —— 决策路由表 + 边界划分写法的典范
   - `lark-im/SKILL.md` —— 大型 skill：核心概念、资源关系图、Shortcut 优先级、权限表
3. **公共依赖**：`lark-shared/SKILL.md` —— 认证/身份/权限/安全/JSON 契约，写任何 lark 类 skill 前必读
4. **制作工具**：
   - 飞书类：用 `lark-skill-maker`（把 API 封装成 skill）
   - 通用类：用 CodeBuddy 的 `skill-creator` skill
5. **本地调试**：`lark-cli skills list` / `lark-cli skills read <skill-name>` 可随时查看内嵌版本与本地文件对照
