import os
import sys
sys.path.append('../')
from utils.data_utils import load_file, save_file

input_path = '../../data/raw_wast_tests/'
output_path = '../../data/no_assert_str_wast_tests/'

file_names = sorted([file for file in os.listdir(input_path) if file.endswith('.wast')])
print(len(file_names))
count = 0
for i, filename in enumerate(file_names):
    print(f'{i} | {filename}')
    content = load_file(f'{input_path}{filename}').strip()
    if content == "":
        print('ERROR!!! EMPTY FILE')
        count += 1
        continue
    print(content)
    content = content.split('"')
    content[-2] = ""
    print(content)
    content = '"'.join(content)
    print(content)
    save_file(content, f'{output_path}{filename}')

print('count', count)
    
