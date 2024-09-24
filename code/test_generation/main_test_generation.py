import os
import sys
import time
import pandas as pd
sys.path.append('../')
from utils.data_utils import load_file, save_file, create_dir
from utils.prompt_utils import generate_test_body
import glob
import random

random.seed(42)

# randomly sample 5 example test cases from human written tests
def load_example_tests(instruction, human_written_tests_path):
    all_tests = glob.glob(f'{human_written_tests_path}/test_{instruction}_*.wast')
    sampled_tests = random.sample(all_tests, min(5, len(all_tests)))

    examples = ''
    for test in sampled_tests:
        examples += load_file(test) + '\n\n'
    
    return examples


def main():
    start_timer = time.time()

    # load constraints
    constraints = pd.read_json("../context/control_flow_constraints_gpt4o.json")
    print(constraints)
    
    # load test descriptions
    test_descriptions = pd.read_json("../context/test_descriptions_gpt4o.json")
    print(test_descriptions)

    # load code context
    implementation1 = "WebAssembly" 
    implementation2 = "wizard_engine"
    
    # load model
    model = "gpt-4o"
    
    human_written_tests_path = '../human_written_tests/WebAssembly/processed_control_flow_validation'
    output_path = f'../../data/all_generated_tests/target_bug_guided_code_diff_{implementation1}_{implementation2}_gpt4o'
    
    create_dir(output_path)
    
    print('----------------<output>-------------------')

    nl_desc_count = 0
    count = 0
    # target examples for all instructions 
    for i, row in test_descriptions.iterrows():
        start = time.time()
        
        instruction = row['instruction']    
        structure_constraints = constraints[constraints['instruction'] == instruction]['structure_constraints'].values[0]
        validation_constraints = constraints[constraints['instruction'] == instruction]['validation_constraints'].values[0]
        instruction_constraints = structure_constraints + '\n\n' + validation_constraints
    
        print(f'--------------------instruction {i}: {instruction}-------------------------')
        
        print('instruction_constraints')
        print(instruction_constraints)
        print('\n\n')
        
        nl_test_descriptions_list = row['nl_test_descriptions'].split('<SEP>')
        nl_test_descriptions_list = [desc.strip() for desc in nl_test_descriptions_list if desc.strip() != '']
        print(f'nl_test_descriptions_list: {len(nl_test_descriptions_list)}')
        
        if (len(nl_test_descriptions_list)) != 10:
            print('ERROR!!!')
        
        nl_desc_count += len(nl_test_descriptions_list)
                
        bug_class = row['bug_class']
        print(f'bug_class: {bug_class}')
        
        
        for k, nl_test_description in enumerate(nl_test_descriptions_list):
                        
            # remove newlines from test description
            nl_test_description = ' '.join(nl_test_description.split('\n')).strip()
            print('NL description of test')
            print(nl_test_description)
            
            example_tests = load_example_tests(instruction, human_written_tests_path)
            
            generated_test = generate_test_body(model, instruction, instruction_constraints, example_tests, nl_test_description)
            
            # invalid test format, remove ticks
            if '```' in generated_test:
                generated_test = '\n'.join([line for line in generated_test.split('\n') if '```' not in line])
                
            # if multiple tests only keep first one
            if '<SEP>' in generated_test:
                generated_test.split('<SEP>')[0]
                            
            # print model response
            print('Generated test')
            print(generated_test)
            print('\n\n')
                            
            generated_test = f";; {nl_test_description}\n\n{generated_test}"
            
            # save output in file
            save_file(generated_test, f"{output_path}/{instruction}_{bug_class.replace(' ', '')}_{count}.wast")
            count += 1
        
            
        end = time.time()

        # log progress 
        print(f"LOG: {i}: {instruction} | {k}: {bug_class} | total tests: {count} | generated_tests count: {len(nl_test_descriptions_list)} | generated tests path: {output_path}/{instruction}_{bug_class.replace(' ', '')}_{count}.wast | time taken: {end - start}")
   
    end_timer = time.time()
    print(f'total: {count}')
    print(f'nl_desc_count: {nl_desc_count}')
    print(f'total time: {end_timer - start_timer}')
   

if __name__ == "__main__":
    main()


# to run file
# python3 -u main_test_generation.py 2>&1 | tee output_test_generation_gpt4o.txt
