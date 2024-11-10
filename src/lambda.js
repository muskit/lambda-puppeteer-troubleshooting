import puppeteer from "puppeteer-core";

export const handler = awslambda.streamifyResponse(async (event, responseStream) => {
    console.log("start of handler...")
    responseStream.setContentType("text/plain")

    console.log("initializing browser...")
    responseStream.write("initializing browser...\n")
    const timeStart = performance.now()

    const browser = await puppeteer.launch({
        args: ['--no-sandbox', '--disable-accelerated-2d-canvas', '--disable-gpu', '--disable-software-rasterizer', '--no-zygote'],
        defaultViewport: { width: 1366, height: 768 },
        ignoreHTTPSErrors: true,
        executablePath: "/usr/bin/chromium-browser",
        headless: true,
        timeout: 0,
        dumpio: true,
    })
    console.log("browser initialized!")

    responseStream.write(`[${performance.now() - timeStart}] browsing to example.com...\n`)
    const page = await browser.newPage()
    await page.goto("https://example.com")
    responseStream.write(`[${performance.now() - timeStart}] finished loading example.com!\n`)

    await browser.close()

    responseStream.write(`[${performance.now() - timeStart}] closed browser!\n`)

    responseStream.end()
})
