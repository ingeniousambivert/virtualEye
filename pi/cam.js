// const PiCamera = require("pi-camera");
// const myCamera = new PiCamera({
//   mode: "photo",
//   output: `${__dirname}/test.jpg`,
//   width: 640,
//   height: 480,
//   nopreview: true
// });

// myCamera
//   .snap()
//   .then(result => {
//     // Your picture was captured
//   })
//   .catch(error => {
//     // Handle your error
//   });

// const { StillCamera } = require("pi-camera-connect");

// const stillCamera = new StillCamera();

// stillCamera
//   .takeImage()
//   .then(image => {
//     fs.writeFileSync("still-image.jpg", image);
//   })
//   .catch(err => {
//     console.log(err);
//   });
const fs = require("fs");
const { StillCamera } = require("pi-camera-connect");

const runApp = async () => {
  const stillCamera = new StillCamera();
  await stillCamera
    .takeImage()
    .then(image => {
      fs.writeFileSync("image.jpg", image);
    })
    .catch(err => {
      console.log(err);
    });
};
runApp();
