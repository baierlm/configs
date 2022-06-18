#!/usr/bin/env /home/mark/.anaconda3/envs/api/bin/python

# dependent on xsel
import os
import pyperclip

from pynput.keyboard import Key, Controller

# 5 ft. = 1.5 m
selection = os.popen('xsel').read()
selection = selection.lower()

unit = 'FEET'

if 'mile' in selection or 'miles' in selection or 'meilen' in selection or 'meile' in selection:
    unit = 'MILES'

if 'inch' in selection or 'inches' in selection or 'zoll' in selection:
    unit = 'INCHES'

imperial_value = ''
for num in selection:
    if num.isnumeric():
        imperial_value += num

    else: break

if not imperial_value:
    exit(1)

imperial_value = int(imperial_value)

if unit == 'INCHES':
    dnd_metric_value = imperial_value * 2.54
elif unit == 'MILES':
    dnd_metric_value = imperial_value * 1.5
else:
    dnd_metric_value = imperial_value /5 * 1.5

dnd_metric_value = round(dnd_metric_value, 2)

metric_unit = 'm'
if unit == 'MILES':
    metric_unit = 'km'

elif dnd_metric_value < 1:
    metric_unit = 'cm'
    dnd_metric_value = dnd_metric_value * 100

if dnd_metric_value.is_integer():
    dnd_metric_value = int(dnd_metric_value)

end_string = f'{dnd_metric_value} {metric_unit}'
print('t', end_string)
pyperclip.copy(end_string)
keyboard = Controller()
with keyboard.pressed(Key.ctrl):
    keyboard.press('v')
    keyboard.release('v')
#spam = pyperclip.paste()
a = os.popen('xclip -selection clipboard -o').read()
