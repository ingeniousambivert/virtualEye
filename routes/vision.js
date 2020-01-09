const express = require("express");
const vision = require("@google-cloud/vision");

const visionRouter = express.Router();

router.get("/", function(req, res, next) {
  res.render("index", { title: "Express" });
  async function quickstart() {
    const client = new vision.ImageAnnotatorClient({
      keyFilename: "APIkey.json"
    });

    // Performs label detection on the image file
    const [result] = await client.labelDetection("./images/object.jpg");
    const labels = result.labelAnnotations;

    console.log("Labels:");
    labels.forEach(label => console.log(label.description));

    console.log("");
    console.log("Objects");

    const [objresult] = await client.objectLocalization("./images/object.jpg");
    const objects = objresult.localizedObjectAnnotations;
    objects.forEach(object => {
      console.log(`${object.name}`);
    });

    console.log("");
    console.log("Logo");

    const [logoresult] = await client.logoDetection("./images/object.jpg");
    const logos = logoresult.logoAnnotations;
    console.log("Logos:");
    logos.forEach(logo => console.log(logo));

    console.log("");
    console.log("Web");

    const [webresult] = await client.webDetection("./images/object.jpg");
    const webDetection = webresult.webDetection;

    if (webDetection.webEntities.length) {
      webDetection.webEntities.forEach(webEntity => {
        console.log(`${webEntity.description}`);
      });
    }
  }

  module.exports = visionRouter;
});
