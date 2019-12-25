const vision = require('@google-cloud/vision');

const client = new vision.ImageAnnotatorClient({
    keyFilename: 'APIkey.json'
});

const [result] = await client.objectLocalization(gcsUri);
const objects = result.localizedObjectAnnotations;
objects.forEach(object => {
  console.log(`Name: ${object.name}`);
  console.log(`Confidence: ${object.score}`);
  const veritices = object.boundingPoly.normalizedVertices;
  veritices.forEach(v => console.log(`x: ${v.x}, y:${v.y}`));
});