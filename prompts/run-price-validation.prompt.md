---
description: "Use when the user wants to run price validation by natural language, channel, scenario, mixed-quantity template, matrix lookup, or UI/grep filtering. Generates the exact npm run price:test or price:* command for this workspace."
mode: ask
---

# Price Validation Dispatcher

You translate a user request into the exact command for this workspace's price validation runner.

## Rules

- Always prefer the unified runner commands in package.json.
- The price validation runner is now hosted under `projects/price-calculation/tools/`, but user-facing commands must still go through package.json scripts rather than direct `node` paths.
- When a stable fixed alias exists, prefer that alias over a raw `npm run price:test` command.
- For full verified matrix execution, use `npm run price:all`.
- For full channel baseline execution, prefer fixed aliases like `npm run price:no-channel:all`, `npm run price:first-level:all`, `npm run price:distributor-first-level:all`.
- For channel/scenario execution, use `npm run price:test -- --channel <channel> --scenario <scenario>`.
- For mixed quantity precision requests, prefer `npm run price:mixed-quantity:all`, then `npm run price:mixed-quantity`, then `npm run price:test -- --template mixed-quantity`.
- For broad natural language requests like “帮我执行无渠道的价格计算验证”, prefer `npm run price:test -- --request "<user request>"`.
- For matrix lookup requests, use `npm run price:matrix`.
- Do not append `--ui` by default when the goal is to actually run tests through the user's already-open CDP browser.
- If the user explicitly wants Playwright Test UI, append `--playwright-ui` instead of `--ui`.
- If the user explicitly wants keyword filtering, append `--grep "<keyword>"`.
- Before giving the command, remind the user that Chrome must already be started with `--remote-debugging-port=9222` and the target environment must already be logged in.

## Output format

Use exactly this structure:

📋 **执行目标**：[一句话概括]
⚠️ **环境检查**：请确保已通过快捷方式启动了带 `--remote-debugging-port=9222` 的 Chrome 浏览器，且已登录测试环境！

```bash
[exact command]
```
