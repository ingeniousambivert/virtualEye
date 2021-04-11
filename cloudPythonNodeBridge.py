
"""from num2words import num2words
from subprocess import call

cmd_beg = 'espeak '
cmd_end = ' 2>/dev/null'  # To dump the std errors to /dev/null


x = int(input("Enter a number: "))
count = num2words(x)+' Count Down Starts'
print(count)

# Replacing ' ' with '_' to identify words in the text entered
count = count.replace(' ', '_')
# Calls the Espeak TTS Engine to read aloud a Text
call([cmd_beg+count+cmd_end], shell=True)

# To do a Count Down
for i in range(x, -1, -1):  # To count numbers down from the entered number till zero
    cmd = num2words(i)  # To convert the Numbers to Text
    print(i)
# Calls the Espeak TTS Engine to read aloud the Numbers
    call([cmd_beg+cmd+cmd_end], shell=True)
"""

from num2words import num2words
from subprocess import call


cmd_beg = 'espeak '
# To play back the stored .wav file and to dump the std errors to /dev/null
cmd_end = ' | aplay /home/pi/Desktop/Text.wav  2>/dev/null'
cmd_out = '--stdout > /home/pi/Desktop/Text.wav '  # To store the voice file

text = input()
print(text)

# Replacing ' ' with '_' to identify words in the text entered
text = text.replace(' ', '_')

# Calls the Espeak TTS Engine to read aloud a Text
call([cmd_beg+cmd_out+text+cmd_end], shell=True)
