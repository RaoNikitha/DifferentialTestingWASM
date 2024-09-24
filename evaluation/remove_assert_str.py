import os
import sys
sys.path.append('../')
from utils.data_utils import load_file, save_file

input_path = '../test_generation/output/BIN_target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/'
output_path = '../test_generation/output/BIN_NO-STR-ASRTS_target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/'

file_names = sorted([file for file in os.listdir(input_path) if file.endswith('.bin.wast')])
print(len(file_names))
count = 0
for i, filename in enumerate(file_names):
    print(f'{i} | {filename}')
    content = load_file(f'{input_path}{filename}').strip()
    if content == "":
        print('ERROR!!! EMPTY FILE')
        count += 1
        continue
    #print(content)
    content = content.split('\n')
    content[-2] = "\"\""
    #print(content)
    content = '\n'.join(content)
    #print(content)
    save_file(content, f'{output_path}{filename}')

print('count', count)
    
