const express = require('express');
const vision = require('@google-cloud/vision');

const app = express();

async function quickstart() {
    const client = new vision.ImageAnnotatorClient({
        keyFilename: 'APIkey.json'
    });
  
    // Performs label detection on the image file
    const [result] = await client.labelDetection('./images/hey.jpg');
    const labels = result.labelAnnotations;
    console.log('Labels:');
    labels.forEach(label => console.log(label.description));
}

quickstart().catch(console.error);

app.listen(8080, '127.0.0.1', () => console.log("Server is running"));
