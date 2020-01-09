const vision = require("@google-cloud/vision");
module.exports.sendLable = function(image) {
  return new Promise(async (resolve, reject) => {
    const client = new vision.ImageAnnotatorClient({
      keyFilename: "APIkey.json"
    });
    const [result] = await client.labelDetection(image);
    const labels = result.labelAnnotations;
    resolve(labels);
  });
};
module.exports.sendText = function(image) {
  return new Promise(async (resolve, reject) => {
    const client = new vision.ImageAnnotatorClient({
      keyFilename: "APIkey.json"
    });
    const [result] = await client.textDetection(image);
    const detections = result.textAnnotations;
    resolve(detections);
  });
};
