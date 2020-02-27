// Partially Working Script
// const path = require("path");
// const { spawn } = require("child_process");

// /**
//  * Run python script, pass in `-u` to not buffer console output
//  * @return {ChildProcess}
//  */
// function runScript() {
//   return spawn("python", [
//     "-u",
//     path.join(__dirname, "test.py"),
//     "--foo",
//     "some value for foo"
//   ]);
// }

// const subprocess = runScript();

// // print output of script
// subprocess.stdout.on("data", data => {
//   console.log(`${data}`);
// });
// subprocess.stderr.on("data", data => {
//   console.log(`error:${data}`);
// });
// subprocess.on("close", () => {
//   console.log("Closed");
// });

let { PythonShell } = require("python-shell");
let pyshell = new PythonShell("test.py");

// PythonShell.run("test.py", null, function(err) {
//   if (err) throw err;
//   console.log("finished");
// });

pyshell.send("hello");

pyshell.on("message", function(message) {
  // received a message sent from the Python script (a simple "print" statement)
  console.log(message);
});
pyshell.end(function(err, code, signal) {
  if (err) throw err;
  //console.log("The exit code was: " + code);
  //console.log("The exit signal was: " + signal);
  //console.log("finished");
});
