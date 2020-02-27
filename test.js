let pythonBridge = require("python-bridge");

let python = pythonBridge();

python.ex`from num2words import num2words`;
python.ex`from subprocess import call`;

python`
cmd_beg = 'espeak '
# To play back the stored .wav file and to dump the std errors to /dev/null
cmd_end = ' | aplay /home/pi/Desktop/Text.wav  2>/dev/null'
cmd_out = '--stdout > /home/pi/Desktop/Text.wav '  # To store the voice file

text = input("Enter the Text: ")
print(text)

# Replacing ' ' with '_' to identify words in the text entered
text = text.replace(' ', '_')

# Calls the Espeak TTS Engine to read aloud a Text
call([cmd_beg+cmd_out+text+cmd_end], shell=True)
`;

python.end();
