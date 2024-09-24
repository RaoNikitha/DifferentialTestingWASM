import os
import sys
sys.path.append('../')
from utils.data_utils import load_pdf
from utils.prompt_utils import extract_manual_instruction_constraints
import json


def main():
    structure_spec_path = "../documents/WebAssembly2.0_controlflow_instructions_sec2.4.8.pdf"
    validation_spec_path = "../documents/WebAssembly2.0_validation_sec3.pdf"
    
    structure_spec = load_pdf(structure_spec_path)
    validation_spec = load_pdf(validation_spec_path)
    
    model = "gpt-4o"
  
    instructions_list =  ['nop', 'unreachable', 'block', 'loop', 'if', 'br', 'br_if', 'br_table', 'return', 'call', 'call_indirect']
    print(f'List of instructions ({len(instructions_list)}): {instructions_list}')

    DATA_COLUMNS = ('instruction', 'structure_constraints', 'validation_constraints')
    constraints = {key: [] for key in DATA_COLUMNS}
    
    for instruction in instructions_list:
        print(f'-----------------<{instruction}>---------------------')
        structure_constraints = extract_manual_instruction_constraints(model, structure_spec, instruction)
        print("--------structure_constraints")
        print(structure_constraints)
        validation_constraints = extract_manual_instruction_constraints(model, validation_spec, instruction)
        print("--------validation_constraints")
        print(validation_constraints)
        
        constraints['instruction'].append(instruction) 
        constraints['structure_constraints'].append(structure_constraints) 
        constraints['validation_constraints'].append(validation_constraints) 
    
    
    with open(f'../context/control_flow_constraints.json', 'w') as f:
        json.dump(constraints, f) 
    

    
if __name__ == "__main__":
    main()

# to run 
# python3 -u main_extract_constraints.py 2>&1 | tee output_extract_constraints.txt
