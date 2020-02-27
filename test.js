let pythonBridge = require("python-bridge");

let python = pythonBridge();

python.ex`from num2words import num2words`;
python.ex`from subprocess import call`;

python`cmd_beg = 'espeak '`;
python`cmd_end = ' | aplay /home/pi/Desktop/Text.wav  2>/dev/null'`;
python`cmd_out = '--stdout > /home/pi/Desktop/Text.wav ' `;
python`text = input("Enter the Text: ")`;
python`print(text)`;
python`text = text.replace(' ', '_')`;
python`call([cmd_beg+cmd_out+text+cmd_end], shell=True)`;

python.end();
