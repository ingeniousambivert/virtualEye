const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");

// Routes
const indexRouter = require("./routes/index");
const visionRouter = require("./routes/vision");

// Listener Stream
//const speechListener = require("./services/speechToText");

const testListener = require("./test");

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
// let command = speechListenerStream();

// const stringSimilarity = require("string-similarity");

// let matches = stringSimilarity.findBestMatch(
//   "Olive-green table for sale, in extremely good condition.",
//   [
//     "For sale: green Subaru Impreza, 210,000 miles",
//     "For sale: table in very good condition, olive green in colour.",
//     "Wanted: mountain bike with at least 21 gears."
//   ]
// );
// console.log(matches);

speechListenerStream();
// Exporting app for server
module.exports = app;
