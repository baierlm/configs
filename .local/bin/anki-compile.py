#!/usr/bin/python3

import sys

with open(sys.argv[1]) as f:
    content = f.read()


question_blocks = content.split('\n\n')

csv_lines = []
for  question_block in question_blocks:
    question, *answers = question_block.split('\n')
    if question != '':

        answers = list(filter(None, answers))
        if len(answers) == 0:
            print(f'Warning!, no answer for "{question}"')

        if len(answers) == 1:
            if answers[0][:1] == '-':
                answers[0] = answers[0][1:]
            if answers[0][:2] == '- ':
                answers[0] = answers[0][2:]


        answers = '</div><div>'.join(answers) 
        csv_lines.append(f'{question}; <div>{answers}</div>')

if len(sys.argv) > 2:
    filename = sys.argv[2]
else:
    if len(sys.argv[1]) > 4 and sys.argv[1][-4:] == '.txt':
        filename = f'{sys.argv[1][:-4]}.csv'
    else: 
        filename = f'{sys.argv[1]}.csv'

with open(filename, 'w+') as f:
    f.write('\n'.join(csv_lines))

print(f'Done! Wrote to file {filename}')
