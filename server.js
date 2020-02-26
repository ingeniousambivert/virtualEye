const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");

// Routes
const indexRouter = require("./routes/index");
const visionRouter = require("./routes/vision");

// Listener Stream
const speechListenerStream = require("./services/speechToText");

const app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

// Set routes
app.use("/", indexRouter);
app.use("/", visionRouter);

// Listening for commands
speechListenerStream();

// Exporting app for server
module.exports = app;
