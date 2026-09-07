> 当前仓库的正式 Playwright 脚本统一放在 `projects/<project-name>/tests/` 下，并通过 `../../../cdp-fixture.js` 复用 Chrome 9222 CDP 连接。

```ts
import { test, expect } from '../../../cdp-fixture.js';
import { PlaywrightAgent } from '@midscene/web/playwright';

const sleep = (ms: number | undefined) => new Promise((r) => setTimeout(r, ms));

test.beforeEach(async ({ page }) => {
  await page.setViewportSize({ width: 1280, height: 768 });
  await page.setExtraHTTPHeaders({
    'User-Agent':
      'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36',
  });
  await page.goto('https://www.ebay.com');
  await sleep(5000);
});

test('search headphone on ebay', async ({ page }) => {
  const agent = new PlaywrightAgent(page);
  const { ai, aiQuery, aiAssert, aiWaitFor, aiNumber, aiBoolean, aiString, aiLocate } = agent;

  // 👀 type keywords, perform a search
  await ai('type "Headphones" in search box, hit Enter');

  await sleep(5000);
  await ai('scroll down the page for 800px');

  // 👀 wait for the loading
  await aiWaitFor('there is at least one headphone item on page');

  // 👀 find the items
  const items = await aiQuery<Array<{ itemTitle: string; price: number }>>(
    '{itemTitle: string, price: Number}[], find item in list and corresponding price'
  );

  const isMoreThan1000 = await aiBoolean(
    'Is the price of the headphones more than 1000?'
  );
  console.log('isMoreThan1000', isMoreThan1000);

  console.log('headphones in stock', items);
  expect(items.length).toBeGreaterThan(0);

  const price = await aiNumber('What is the price of the first headphone?');
  console.log('price', price);

  const name = await aiString('What is the name of the first headphone?');
  console.log('name', name);

  const location = await aiLocate(
    'What is the location of the first headphone?'
  );
  console.log('location', location);

  // 👀 assert by AI
  await aiAssert('There is a category filter on the left');
});
```