const express = require("express");
const vision = require("@google-cloud/vision");

const app = express();

async function quickstart() {
  const client = new vision.ImageAnnotatorClient({
    keyFilename: "APIkey.json"
  });

  // Performs label detection on the image file
  const [result] = await client.labelDetection("./public/images/image.jpg");
  const labels = result.labelAnnotations;

  console.log("");
  console.log("Labels:");
  labels.forEach(label => {
    console.log(label.description);
  });

  console.log("");
  console.log("Objects:");

  const [objresult] = await client.objectLocalization(
    "./public/images/image.jpg"
  );
  const objects = objresult.localizedObjectAnnotations;
  objects.forEach(object => {
    console.log(`${object.name}`);
  });
  console.log("");
  console.log("Finished");
  process.exit();
}

quickstart().catch(console.error);

app.listen(8080, "127.0.0.1", () => console.log("Server is proccessing"));
