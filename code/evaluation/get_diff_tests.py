import os
import sys
sys.path.append('../')
from utils.data_utils import load_file, save_file
import pandas as pd
import json

test_implementation = 'wizard_eng'
#test_implementation = 'v8'
#test_implementation = 'wasmtime'

tests_file_path = '../../data/all_generated_tests/raw_wast_tests'
raw_data = load_file(f'../test_generation/output/logs_{test_implementation}__wasm_spec.out')

samples = raw_data.split("========================")
print(len(samples))

DATA_COLUMNS = ('instruction', 'filepath', 'filename', 'test_content', 'spec_interpreter_output', f'{test_implementation}_output')
diff_tests = {key: [] for key in DATA_COLUMNS}

for i, sample in enumerate(samples):
    print(f'{i}/{len(samples)}')
        
    if sample.strip().endswith('+++++'):
        print('diff test found')
        sample_logs = [line.strip() for line in sample.split('\n') if line.strip() != '']
            
        filepath = (sample_logs[0].replace('=', '')).replace('Running', '').strip()
        print('filepath:', filepath)
        filename = filepath.split('/')[-1].split('.')[0]
        print('filename:', filename)
        
        instruction = filepath.split('/')[-1].split('_')[0]
        print('instruction:', instruction)
        
        spec_interpreter_output = sample_logs[-3].split(' ')[3]
        print('spec_interpreter_output:', spec_interpreter_output)
        
        target_interpreter_output = sample_logs[-2].split(' ')[2]
        print('target_interpreter_output:', target_interpreter_output)
        
        test_content = load_file(f'{tests_file_path}/{filename}.wast')
        print('test content', test_content)
           
        diff_tests['instruction'].append(instruction) 
        diff_tests['filepath'].append(filepath) 
        diff_tests['filename'].append(filename) 
        diff_tests['test_content'].append(test_content) 
        diff_tests['spec_interpreter_output'].append(spec_interpreter_output) 
        diff_tests[f'{test_implementation}_output'].append(target_interpreter_output) 
    
    with open(f'./output/diff_tests__wasm_spec__{test_implementation}.json', 'w') as f:
        json.dump(diff_tests, f) 

df = pd.read_json(f'./output/diff_tests__wasm_spec__{test_implementation}.json')
print(df)
df.to_json(f'./output/diff_tests__wasm_spec__{test_implementation}.json', orient='records')


# to run file
# python3 get_diff_tests.py