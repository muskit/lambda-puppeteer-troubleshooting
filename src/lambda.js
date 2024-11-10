// import { safeLaunchBrowser } from "./browser-retry.js";
import { createBrowser } from "./browser.js";

async function heartbeat(n = 0) {
    console.log(`heartbeat: ${n}`)
    setTimeout(() => heartbeat(n + 1), 500)
}
// heartbeat();

export const handler = awslambda.streamifyResponse(async (event, responseStream) => {
    console.log("start of handler...")
    responseStream.setContentType("text/plain")

    console.log("initializing browser...")
    responseStream.write("initializing browser...\n")
    const timeStart = performance.now()

    const browser = await createBrowser()
    console.log("browser initialized!")

    responseStream.write(`[${performance.now() - timeStart}] browsing to example.com...\n`)
    const page = await browser.newPage()
    await page.goto("https://example.com")
    responseStream.write(`[${performance.now() - timeStart}] finished loading example.com!\n`)

    await browser.close()

    responseStream.write(`[${performance.now() - timeStart}] closed browser!\n`)

    responseStream.end()
})
