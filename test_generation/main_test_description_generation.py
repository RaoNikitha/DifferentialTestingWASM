import os
import sys
#from dotenv import load_dotenv
import time
import pandas as pd
sys.path.append('../')
from utils.prompt_utils import generate_test_descriptions_from_bug_code_diff
import json

# generate test descriptions from bug & code diff
def main():
    start_timer = time.time()
    
    # load constraints
    constraints = pd.read_json('../context/control_flow_constraints.json')
    print(constraints)
    
    # load code context
    implementation1 = 'WebAssembly'
    implementation2 = 'wizard_engine'
    code_context = pd.read_json('../context/code_context.json')
    print(code_context)
    
    # load bug classes 
    bugs = pd.read_json('../context/bug_classes.json')
    print(bugs)

    # load model
    model = 'gpt-4o'
    
    DATA_COLUMNS = ('instruction', 'bug_class', 'bug_description', 'code_diff', 'nl_test_descriptions')
    test_descriptions = {key: [] for key in DATA_COLUMNS}
    
    print('----------------<output>-------------------')
    
    # target examples for all instructions 
    for i, row in constraints.iterrows():
        instruction = row['instruction']
        structure_constraints = row['structure_constraints']
        validation_constraints = row['validation_constraints']
        instruction_constraints = structure_constraints + '\n\n' + validation_constraints
        
        print(f'instruction {i}: {instruction}')
        
        print('instruction_constraints')
        print(instruction_constraints)
        print('\n\n')

        for k, bug in bugs.iterrows():
            start = time.time()
            
            bug_class = bug['bug_class']
            bug_description = bug['description']
            print(f'BUG {k}: {bug_class} - {bug_description}')

            code_diffs = code_context[code_context['instruction'] == instruction]['code_diffs'].values[0]
            print('code_diffs')
            print(code_diffs)
            print('\n\n')

            for code_diff in code_diffs.split('<SEP>'):
            
                print('code diff')
                print(code_diff)
                print('\n\n')

                nl_test_descriptions = generate_test_descriptions_from_bug_code_diff(model, instruction, instruction_constraints, code_diff, bug_class, bug_description, implementation1, implementation2)
                print('nl_test_descriptions')
                print(nl_test_descriptions)
                print('\n\n')

                test_descriptions['instruction'].append(instruction) 
                test_descriptions['bug_class'].append(bug_class) 
                test_descriptions['bug_description'].append(bug_description) 
                test_descriptions['code_diff'].append(code_diff) 
                test_descriptions['nl_test_descriptions'].append(nl_test_descriptions) 
            
            end = time.time()

            # log progress 
            print(f'{i}: {instruction} | {k}: {bug_class} | time taken: {end - start}')
    
    with open(f'../context/test_descriptions.json', 'w') as f:
        json.dump(test_descriptions, f) 
        
    end_timer = time.time()
    print(f'total time: {end_timer - start_timer}')


if __name__ == "__main__":
    main()


# to run file
# python3 -u main_test_decription_generation.py 2>&1 | tee output_test_decription_generation.txt
