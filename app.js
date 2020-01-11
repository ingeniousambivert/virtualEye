const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const busboy = require("connect-busboy");
const indexRouter = require("./routes/index");
const visionRouter = require("./routes/vision");
const bodyParser = require("body-parser");
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(busboy());
app.use(logger("dev"));

app.use(express.static(path.join(__dirname, "public")));
app.use(busboy());
app.use("/", indexRouter);
app.use("/", visionRouter);
module.exports = app;
