import os
import sys
sys.path.append('../')
from utils.data_utils import load_file
from utils.prompt_utils import extract_relevant_code, generate_differences_from_code_snippets
import pandas as pd
import json


def main():
    # load constraints
    constraints_path = "../context/control_flow_constraints.json"
    constraints = pd.read_json(constraints_path)

    print(constraints)

    # load code files
    codefile1 = load_file('../context/code/WebAssembly_spec_interpreter_valid.ml') 
    codefile2 = load_file('../context/code/wizard_engine_CodeValidator.v3') 
    implementation1 = "WebAssembly" 
    implementation2 = "wizard_engine"
    
    model = "gpt-4o"
    
    DATA_COLUMNS = ('instruction', 'src_code1', 'src_code2', 'code_diffs')
    code_context = {key: [] for key in DATA_COLUMNS}
    
    for i, row in constraints.iterrows():
        instruction = row['instruction']
        structure_constraints = row['structure_constraints']
        validation_constraints = row['validation_constraints']
        
        print(f'-----------------< {i}: {instruction} >---------------------')
        
        instruction_constraints = structure_constraints + '\n\n' + validation_constraints
        print('instruction_constraints')
        print(instruction_constraints)
        print('\n\n')

        # extract code for given instruction
        src_code1 = extract_relevant_code(model, instruction, instruction_constraints, codefile1, implementation1)
        src_code2 = extract_relevant_code(model, instruction, instruction_constraints, codefile2, implementation2)
        
        print(f'src_code1')
        print(src_code1)
        print('\n\n')
        
        print(f'src_code2')
        print(src_code2)
        print('\n\n')
        
        # generate list of differences for the two code snippets extracted
        code_diffs = generate_differences_from_code_snippets(model, instruction, instruction_constraints, src_code1, src_code2, implementation1, implementation2)

        print(f'diff in code snippets')
        print(code_diffs)
        print('\n\n')
        
        code_context['instruction'].append(instruction) 
        code_context['src_code1'].append(src_code1) 
        code_context['src_code2'].append(src_code2) 
        code_context['code_diffs'].append(code_diffs) 
    
    with open(f'../context/code_context.json', 'w') as f:
        json.dump(code_context, f)     

    
if __name__ == "__main__":
    main()

# to run 
# python3 -u main_extract_code_diffs.py 2>&1 | tee output_extract_code_diffs.txt
