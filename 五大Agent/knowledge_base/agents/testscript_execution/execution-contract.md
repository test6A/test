# 测试执行与汇总细则

## 1. 执行红线
- 禁止直接用 node 跑 spec。
- 普通 Playwright 执行使用 npx playwright test。
- 价格场景优先使用 npm run price:test 或现成 price 别名。
- 不得建议修改 fixture 导入来源。
- 正式脚本仍使用 ../../../cdp-fixture.js。
- 默认不要追加 --ui；只有用户明确要求 Playwright UI 调试时才加。

## 2. 环境提醒
在输出任何执行命令前，都应提醒：
- Chrome 已通过 remote debugging 方式启动。
- 当前测试环境已登录。
- 默认复用已打开的 CDP 浏览器窗口执行。

## 3. 常见执行模板
- 单文件：npx playwright test projects/<project-name>/tests/<file>.spec.js
- 关键字：npx playwright test -g "关键字"
- 全量：npx playwright test
- 项目级别名：优先使用已有 npm script，例如 price:test、price:all
- 价格统一执行：npm run price:test -- --channel <channel> --scenario <scenario>
- 价格自然语言：npm run price:test -- --request "原话"
- 报告汇总：优先使用项目已有 report 脚本；否则读取 Playwright JSON 报告汇总

## 4. 报告质量提醒
执行命令前必须提醒脚本满足以下规范：
- 使用 expect.soft()
- 失败时输出结构化错误信息：
  TC_ID=xxx | SOURCE_POINT_ID=xxx | BLOCKED_STAGE=xxx | REASON=xxx | EXPECTED=xxx | ACTUAL=xxx | PAGE_URL=xxx
- 若已实现附件能力，保留失败摘要、字段差异、失败截图、页面地址

## 5. 执行后汇总
只要 agent 实际执行了测试，就不能只说“执行完成”，必须补结果汇总。
汇总至少包含：
- 总用例数
- 通过数
- 失败数
- 跳过数
- 失败 tcId 列表
- 每条失败的 blockedStage
- 每条失败的 reason

优先级：
- 优先读取 Playwright JSON 报告做统计
- HTML 报告只作为人工排查入口，不作为唯一结果来源

## 6. 标准输出结构
建议输出顺序：
1. 执行目标
2. 执行场景
3. 环境检查
4. 执行方式
5. 结构化报告质量提醒
6. 执行命令
7. 若已实际执行，则追加结果汇总

## 7. 多项目适配
- 若仓库已有项目级运行入口，优先走项目脚本，不重复拼接长命令。
- 若用户未提供完整文件名，不要脑补路径，应先要求提供相对路径。
- 若项目未提供汇总脚本，则回退到读取 JSON 报告做通用统计。
