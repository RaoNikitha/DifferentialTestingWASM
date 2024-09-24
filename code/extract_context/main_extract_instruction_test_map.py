import os
import sys
sys.path.append('../')
from utils.data_utils import load_pdf
from utils.prompt_utils import extract_instructions_list, get_mapping_instructions_testfiles

def get_groundtruth_tests(path):
    file_names = sorted([file for file in os.listdir(path) if not file.endswith('.bin.wast')])
    return file_names


def main():
    spec_path = "../documents/WebAssembly2.0_controlflow_instructions_sec2.4.8.pdf"
    existing_tests_path = "../human_written_tests/WebAssembly/spec_test_core"
    
    manual = load_pdf(spec_path)
    model = "gpt-4o"
  
    instructions_list = extract_instructions_list(model, manual)
    print(f'-----------------<output>---------------------')
    print(instructions_list)
  
    control_flow_instructions = ['nop', 'unreachable', 'block', 'loop', 'if', 'br', 'br_if', 'br_table', 'return', 'call', 'call_indirect']
    
    instructions_list = control_flow_instructions
    print(f'List of instructions ({len(instructions_list)}): {instructions_list}')

    true_test_filenames = get_groundtruth_tests(existing_tests_path)
    print(f'List of ground truth test file names ({len(true_test_filenames)}): {true_test_filenames}')
    
    mapping = get_mapping_instructions_testfiles(model, instructions_list, true_test_filenames)

    print(f'-----------------<output mapping>---------------------')
    print(mapping) 
    

    
if __name__ == "__main__":
    main()

# to run 
# python3 -u main_extract_instruction_test_map.py 2>&1 | tee output_extract_instructions.txt
