// Index

if (!process.env.NODE_ENV) {
    process.env.NODE_ENV = "development"
}

// Init logger.
import logger = require("anyhow")
logger.setup("console")
logger.levelOnConsole = true
logger.uncaughtExceptions = true
logger.unhandledRejections = true

// Init expresser.
import expresser = require("expresser")
const app = expresser.app
app.init()

// Home route.
const getHome = (req, res) => {
    app.renderView(req, res, "index.html")
}
app.get("/", getHome)
