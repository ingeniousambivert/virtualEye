const express = require("express");
const servie = require("../services/service");
//const vision = require("@google-cloud/vision");

const visionRouter = express.Router();

visionRouter.get("/vision/:id", function(req, res, next) {
  let prom;
  if (req.params.id == 1) {
    prom = servie.sendLable("./public/images/object.jpg");
  } else if (req.params.id == 2) {
    prom = servie.sendText("./public/images/object.jpg");
  } else if (req.params.id == 3) {
    res.send({ msg: "face recognition under constraction" });
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
