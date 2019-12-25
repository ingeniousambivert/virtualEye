var AWS = require('aws-sdk');

//AWS access details
AWS.config.update({
    accessKeyId: 'AKIA5Q5TOFRRRVR5HSUD',
    secretAccessKey: 'gjBzOw0KZvg0XT/u1EsEDyGjI6i0sCq8jairIQnvgjBzOw0KZvg0XT/u1EsEDyGjI6i0sCq8jairIQnv',
    region: 'us-west-2'
  });

  //input parameters
  var params = {
    Image: {
     S3Object: {
      Bucket: "vision-image-98", 
      Name: "hey.jpg"
     }
    }
   };

   //Call AWS Rekognition Class
  const rekognition = new AWS.Rekognition();
  var detectedTXT;

  //Detect text
  rekognition.detectText(params, function(err, data) {
    if (err) console.log(err, err.stack); // an error occurred
    else     console.log(data);           // successful response

    //console.log(data.TextDetections);


    for(var i = 0; i < data.TextDetections.length;i++){

      //console.log(data.TextDetections[i].Type)

      if(data.TextDetections[i].Type === 'LINE')
      {
        detectedTXT = data.TextDetections[i].DetectedText;
      }
    }

    console.log(detectedTXT);

  });
