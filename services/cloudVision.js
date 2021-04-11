const express = require("express");
const vision = require("@google-cloud/vision");

const SimpleTTS = require("simpletts");
const tts = new SimpleTTS();
const fs = require("fs");
const { StillCamera } = require("pi-camera-connect");

const runApp = async () => {
  const stillCamera = new StillCamera();
  await stillCamera
    .takeImage()
    .then(image => {
      fs.writeFileSync("image.jpg", image);
      startRecognizing().catch(console.error);
    })
    .catch(err => {
      console.log(err);
    });
};
runApp();

const app = express();

async function startRecognizing() {
  const client = new vision.ImageAnnotatorClient({
    keyFilename: "../configs/APIKeyForCloud.json"
  });

  // Performs label detection on the image file
  const [result] = await client.labelDetection("./image.jpg");
  const labels = result.labelAnnotations;

  console.log("Labels:");
  str = "There are ";

  labels.forEach(label => {
    console.log(label.description);
    str += label.description + ",";
  });

  tts
    .getVoices()
    .then(voices => {
      let voiceValue = 7;
      tts.read({ text: str, voice: voices[voiceValue] });
      // console.log(voices[voiceValue].name);
    })
    .catch(err => {
      console.log(err);
    });

  console.log("");
  console.log("Objects");

  const [objresult] = await client.objectLocalization("./image.jpg");
  const objects = objresult.localizedObjectAnnotations;
  objects.forEach(object => {
    console.log(`${object.name}`);
  });

  // console.log("");
  // console.log("landmark");

  // const [landresult] = await client.landmarkDetection(
  //   "../public/images/image.jpg"
  // );
  // const landmarks = landresult.landmarkAnnotations;
  // console.log("Landmarks:");
  // landmarks.forEach(landmark => console.log(landmark));

  console.log("Finished");
}
