# CodeBuddy Skills 保姆级使用教程

> **适用用户**：杨梦宇（锐捷，OU `ou_a92158795...`，飞书应用 `cli_*` 前缀）
> **客户端**：`lark-cli` v1.0.86，已授权 user 身份的 `im:message.send_as_user`
> **工作目录**：`d:\ai_lab\返利`（PowerShell 5.1 环境）
> **数据来源**：本会话已实操的 27 个 lark-\* + 4 个平台/通用技能（共 31 个）

---

## 〇、通用前置（必读）

1. **身份**：`lark-cli <cmd> --as user | --as bot`（省略会跑偏；user/bot 行为差异巨大）
2. **权限不足**：先 `lark-cli auth login --scope "<scopes>" --no-wait --json` → 展示 verification_url → 用户授权后 `lark-cli auth login --device-code <code>` 续上
3. **风险分级**：`read`（安全）→ `write`（默认安全）→ **`high-risk-write`（必须显式 `--yes`，且仅在用户已确认后由我代为加）**
4. **文件路径**：所有 `--file / --output` 仅接受**相对路径**；绝对路径报 `unsafe file path`
5. **中文乱码**：PowerShell 5.1 传中文给 lark-cli 会把 UTF-8 当 GBK → 用 `[char]0x4F60+[char]0x597D` 构造"你好"或写 UTF-8 BOM 文件
6. **分页**：可用 `--page-all` 自动翻页，否则手动传 `--page-token`
7. **大 JSON**：PowerShell 推荐写 UTF-8 BOM 临时文件 + `@./file.json` 传参

---

## 一、飞书系列（lark-\*，27 个）

### 1.1 高频 — 日常用

| Skill | 用途 | 必备 scope | 是否已授权 |
|-------|------|-----------|----------|
| **lark-shared** | 认证/全局规则（前置） | 所有 | ✅ |
| **lark-im** | 收消息 / 发消息 / 群管 / 卡片 / 表情 / 撤回 / Feed 置顶 / 监听卡片回调 | `im:message.send_as_user`（已授）；其他 `im:chat.*` `im:message.reactions:*` 按需 | ✅ 发消息 |
| **lark-contact** | 按姓名/邮箱查 open_id、搜 bot、按 id 查资料 | `contact:user.*`（基础） | ✅ |
| **lark-calendar** | 日程增删改查 / 会议室预定 / 忙闲查询 / 推荐时段 | `calendar:calendar.event:read`（已授）；写 `calendar:calendar.event:write` | ✅ 读 |
| **lark-task** | 待办任务 / 清单 / 子任务 / 分配协作 / 附件 / 任务智能体 | `task:task:read`（已授）；写 `task:task:write` | ✅ 读 |
| **lark-mail** | 起草/发送/转发邮件 / 邮件文件夹 / 标签 / 联系人 / 收信规则 / 监听新邮件 | `mail:user_mailbox:read`（已授）；写 `mail:user_mailbox:write` | ✅ 读 |
| **lark-doc** | 云文档（docx/wiki）内容操作（读写、思维笔记、图片附件） | `docs:document:read`（已授）；写 `docs:document:write` | ✅ 读 |
| **lark-drive** | 云空间文件/文件夹管理（上传/下载/复制/移动/删除/版本/评论/密级标签/本地导入） | `drive:drive:read`（已授）；写 `drive:drive:write` | ✅ 读 |

### 1.2 中频 — 每周用几次

| Skill | 用途 | 关键 scope |
|-------|------|----------|
| **lark-approval** | 审批待办/已办/实例、搜索定义、发起原生审批 | `approval:approval:read`（已授） |
| **lark-apps** | 妙搭（Spark/Miaoda）应用开发：本地全栈 / 云端迭代 / UI mockup / PPT / 视觉探索 / 自动化触发器 / 协作者角色 / 环境变量 / 日志 trace | 妙搭自有 scope |
| **lark-base** | 多维表格（Base/Bitable）建表/字段/记录/视图/公式/表单/仪表盘/workflow/权限 | `base:base:read`（已授） |
| **lark-sheets** | 电子表格增删改查、公式、图表、透视表、条件格式、迷你图、浮动图片 | `sheets:spreadsheet:read`（已授） |
| **lark-slides** | 幻灯片创建/编辑/页面管理/局部替换 | `slides:presentation:read`（已授） |
| **lark-wiki** | 知识空间/空间成员/节点层级/快捷方式 | `wiki:wiki:read`（已授） |

### 1.3 低频 — 特殊场景

| Skill | 用途 | 关键 scope |
|-------|------|----------|
| **lark-attendance** | 查询自己的考勤打卡记录 | `attendance:attendance:read` |
| **lark-event** | **流式事件订阅**（IM 消息、卡片回调、审批状态、任务更新、VC 开始/加入/结束等）| `im:message:receive` 等 |
| **lark-markdown** | Markdown 文件查看/创建/上传/编辑/比较（**不**负责导入飞书在线文档） | `docs:document:read` |
| **lark-minutes** | 妙记：搜索/下载音视频/读取或编辑产物/替换说话人/申请权限 | `minutes:minutes:read` |
| **lark-note** | 已知 note_id 直查会议纪要详情、关联文档、逐字记录 | `minutes:minutes:read` |
| **lark-okr** | OKR 周期/目标/关键结果/对齐关系/量化指标/进展 | `okr:okr:read` |
| **lark-openapi-explorer** | 探索**未**被现有 lark-\* 封装的飞书原生 OpenAPI | 视具体 API |
| **lark-shared** | 已在 1.1 | — |
| **lark-skill-maker** | 把飞书 API 操作封装成可复用 Skill | — |
| **lark-vc** | 查询进行中会议 + 会中实时内容 + 历史会议 + 参会人快照 + 纪要 | `vc:video:read` |
| **lark-vc-agent** | 让机器人**真实加入/离开**会议 + 读会中事件 + 发会中消息/表情 | `vc:video:write` |
| **lark-whiteboard** | 飞书画板：导出图片/原始节点/更新画板 | `board:board:read` |
| **lark-workflow-meeting-summary** | 编排 `lark-vc` + `lark-minutes` 汇总一段时间内的会议纪要，生成结构化周报 | 组合 |
| **lark-workflow-standup-report** | 编排 `lark-calendar +agenda` + `lark-task +get-my-tasks` 生成某日日程 + 未完成任务摘要 | 组合 |

### 1.4 命令速查（按场景）

#### IM 发消息（lark-im）
```bash
# 单聊
lark-cli im +messages-send --user-id ou_xxx --text "你好" --as user
# 群聊 @人（中文用 [char] 构造或 UTF-8 BOM 文件）
lark-cli im +messages-send --chat-id oc_xxx --markdown $'<at user_id="ou_xxx">张三</at> 项目已部署' --as user
# 列消息 / 查内容 / 撤回
lark-cli im +chat-messages-list --chat-id oc_xxx --as user
lark-cli im +messages-mget --message-ids "om_xxx,om_yyy" --as user
lark-cli im messages delete --message-id om_xxx --yes --as user   # high-risk
# 创建群
lark-cli im +chat-create --user-ids "ou_xxx,ou_yyy" --chat-mode group --name "项目群" --as user
```

#### 联系人（lark-contact）
```bash
lark-cli contact +search-user --query "yaojinsheng" --as user         # 避中文用邮箱前缀
lark-cli contact +search-bot --queries "会议助手,日报助手" --as user
lark-cli contact +get-user --user-id ou_xxx --as bot
```

#### 日历与会议室（lark-calendar）
```bash
lark-cli calendar +agenda --as user                                    # 今天日程
lark-cli calendar +agenda --start "2026-09-02T00:00" --end "2026-09-03T00:00" --as user
lark-cli calendar +create --summary "周会" --start "..." --end "..." \
  --attendee-ids "ou_xxx,omm_xxx" --as user
lark-cli calendar +room-find --room-name "301" --start "..." --end "..." --as user
lark-cli calendar +freebusy --user-id ou_xxx --as user
```

#### 任务（lark-task）
```bash
lark-cli task +get-my-tasks --as user
lark-cli task +create-task --summary "跟 X 确认" --due "2026-09-05" --as user
lark-cli task +update-task --task-id t_xxx --completed true --as user   # write
```

#### 邮件（lark-mail）
```bash
lark-cli mail +list --as user --folder INBOX
lark-cli mail +send --to "user@example.com" --subject "..." --body "..." --as user
lark-cli mail +draft --to "..." --subject "..." --body "..." --as user
```

#### 文档（lark-doc / drive）
```bash
lark-cli doc +read --url "https://..." --as user
lark-cli doc +create --title "新文档" --content "..." --as user
lark-cli drive +list --folder-id fld_xxx --as user
lark-cli drive +upload --file ./本地.txt --folder-id fld_xxx --as user
```

#### 多维表格（lark-base）
```bash
lark-cli base +list-tables --app-token bcn_xxx --as user
lark-cli base +list-records --app-token bcn_xxx --table-id tbl_xxx --as user
lark-cli base +create-record --app-token bcn_xxx --table-id tbl_xxx --fields '{"col_xxx":"value"}' --as user
```

#### 电子表格（lark-sheets）
```bash
lark-cli sheets +list-sheets --spreadsheet-token sht_xxx --as user
lark-cli sheets +read --spreadsheet-token sht_xxx --range "A1:C10" --as user
lark-cli sheets +write --spreadsheet-token sht_xxx --range "A1" --values '[["a","b"]]' --as user
```

#### 知识库（lark-wiki）
```bash
lark-cli wiki +list-spaces --as user
lark-cli wiki +list-nodes --space-id spc_xxx --as user
lark-cli wiki +create-node --space-id spc_xxx --title "..." --obj-type docx --as user
```

#### 流程编排（work-flow 类）
```bash
# 会议纪要周报
lark-cli workflow-meeting-summary --start "2026-08-25" --end "2026-08-31" --as user
# 日程待办摘要
lark-cli workflow-standup-report --date "2026-09-02" --as user
```

---

## 二、平台/通用技能（4 个）

#### ruijie-dev-platform — 锐捷 DevOps 平台
- **做什么**：查询/操作开发平台、系统、前端/后端服务、中间件、数据库、域名、流水线构建、部署发布、查看版本/实例/Pod/日志、排查构建/发布/运行问题
- **何时用**：找服务地址、看 Pod 日志、触发/回滚发布、改配置
- **重要**：**生产环境、删除、回滚必须二次确认**

#### demo-dev-platform — 克隆演示版 B 公司开发平台
- 用途同 ruijie-dev-platform，但是「克隆演示版」——用于 demo 演练，**不操作真实生产环境**

#### 多模态内容生成 — AI 生成媒体内容
- **做什么**：文生视频 / 图生视频 / 文生图片 / 文生 3D / 图生 3D / 图片视频特效
- **何时用**：老板/同事让你 "AI 做个海报"、"生成一段视频"、"做个产品图"等
- **注意**：需要联网调上游模型服务；大模型生成通常要等几秒到几十秒

#### lsp-code-analysis — 语义代码分析
- **做什么**：跳转到定义、找引用、找实现、查类型、读符号大纲、调用层级
- **何时用**：不熟悉某个类在哪定义的、想知道谁调用了这个函数、重构前的影响面分析
- **优势**：相比 ripgrep/grep 准得多（按 symbol 类型精确过滤）

---

## 三、最佳实践速查（来自多次踩坑）

| 场景 | 做法 |
|------|------|
| 命令中文乱码 | `[char]0x4F60+[char]0x597D` 构造"你好"；或写 UTF-8 BOM 临时文件 |
| 命令找不到、查询无结果 | 用邮箱前缀/拼音代替中文 `--query`（如 `"yaojinsheng"` 而非 `"姚进升"`） |
| 权限不足报错 | 看错误 hint 里的 `missing_scopes`，照提示走 `--scope` 授权 |
| high-risk-write 操作 | 先 `--dry-run` 预览 → 用户确认 → 加 `--yes` 执行（**绝不**擅自加 `--yes`） |
| user/bot 身份混淆 | 默认 `--as user`；只有"以机器人身份发消息/加群"才 `--as bot` |
| 搜索命中多条 contact | 列候选给用户挑，不擅自选第一条 |
| 文件路径报错 | 改用 CWD 相对路径；写文件用 `./xxx.json` |
| 中文 JSON 入参乱码 | PowerShell 写 UTF-8 BOM 临时文件 + `@./x.json` |
| bot 缺权限禁止 `auth login` | 改用错误里的 `console_url` 引导去飞书开发者后台开权限 |
| 飞书调用频率限制 | 单次批量优先；列表接口用 `--page-all` 翻完一页再操作 |
| 撤回消息（不可逆） | 必须用户明确确认后再 `lark-cli im messages delete --yes` |
| 会议室预定数据在哪？ | 飞书日历（`lark-calendar +room-find / +freebusy`）概率最大；锐捷 mt-mobile 系统作为兜底 |

---

## 四、向上扩展路线（后续可能新增的 skill）

- **agent-browser** — 浏览器自动化（已存在于本地，与 playwright-cli 互补）
- **pptx / docx / xlsx / pdf** — 文档生成与处理
- **playwright-cli** — 浏览器自动化（已用）
- **find-skills / skill-creator** — 发现/创建技能

如需某个 skill 的完整教程（极详版），单独告诉我 "教程 +lark-xxx"。