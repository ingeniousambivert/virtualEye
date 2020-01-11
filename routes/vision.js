const express = require("express");
const servie = require("../services/service");
//const vision = require("@google-cloud/vision");
var multer = require("multer");
var upload = multer({ dest: "./public/images/" });
const visionRouter = express.Router();

visionRouter.post("/vision/:id", upload.single("avatar"), function(
  req,
  res,
  next
) {
  console.log();
  let prom;
  if (req.params.id == 1) {
    prom = servie.sendLable(`./public/images/${req.file.filename}`);
  } else if (req.params.id == 2) {
    prom = servie.sendText(`./public/images/${req.file.filename}`);
  } else if (req.params.id == 3) {
    res.send({ msg: "face recognition under progress" });
    return;
  } else {
    res.status(400).send({ msg: "something went wrong" });
    return;
  }
  prom
    .then(result => {
      res.send(result);
    })
    .catch(() => {
      res.send({ msg: "something went wrong" });
    });
});

module.exports = visionRouter;
