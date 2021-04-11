const express = require("express");
const service = require("../services/cloudService");
//const vision = require("@google-cloud/vision");

const visionRouter = express.Router();

visionRouter.get("/vision/:id", function(req, res, next) {
  let prom;
  if (req.params.id == 1) {
    prom = service.sendLabel("./public/images/object.jpg");
  } else if (req.params.id == 2) {
    prom = service.sendText("./public/images/object.jpg");
  } else if (req.params.id == 3) {
    res.send({ msg: "Work in progress" });
    return;
  } else {
    res.status(400).send({ msg: "Something went wrong" });
    return;
  }
  prom
    .then(result => {
      res.send(result);
    })
    .catch(() => {
      res.send({ msg: "Something went wrong" });
    });
});

module.exports = visionRouter;
