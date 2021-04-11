const vision = require("@google-cloud/vision");

module.exports.sendLabel = image => {
  return new Promise(async (resolve, reject) => {
    const client = new vision.ImageAnnotatorClient({
      keyFilename: "../configs/APIKeyForCloud.json"
    });
    const [result] = await client.labelDetection(image);
    const labels = result.labelAnnotations;
    resolve(labels);
  });
};
module.exports.sendText = image => {
  return new Promise(async (resolve, reject) => {
    const client = new vision.ImageAnnotatorClient({
      keyFilename: "../configs/APIKeyForCloud.json"
    });
    const [result] = await client.textDetection(image);
    const detections = result.textAnnotations;
    resolve(detections);
  });
};

module.exports.sendObjects = image => {
  return new Promise(async (resolve, reject) => {
    const client = new vision.ImageAnnotatorClient({
      keyFilename: "../configs/APIKeyForCloud.json"
    });
    const [result] = await client.objectLocalization(image);
    const objects = objresult.localizedObjectAnnotations;
    resolve(objects);
  });
};
