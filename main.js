const express = require('express');
const vision = require('@google-cloud/vision');

const app = express();

async function quickstart() {
    const client = new vision.ImageAnnotatorClient({
        keyFilename: 'APIkey.json'
    });
  
    // Performs label detection on the image file
    const [result] = await client.labelDetection('./images/object1.jpeg');
    const labels = result.labelAnnotations;

    console.log('Labels:');
    labels.forEach(label => {
        console.log(label.description);
    });

    console.log("");
    console.log("Objects");

    const [objresult] = await client.objectLocalization('./images/object1.jpeg');
    const objects = objresult.localizedObjectAnnotations;
    objects.forEach(object => {
    console.log(`${object.name}`);
    });

    console.log("");
    console.log("landmark");

    const [landresult] = await client.landmarkDetection('./images/object1.jpeg');
    const landmarks = landresult.landmarkAnnotations;
    console.log('Landmarks:');
    landmarks.forEach(landmark => console.log(landmark));

    console.log("Over");
}

quickstart().catch(console.error);

app.listen(8080, '127.0.0.1', () => console.log("Server is running"));