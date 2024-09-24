import sys
sys.path.append('../')
from utils.model_utils import prompt_model


def extract_instructions_list(model, manual):
    prompt = f"Here is the official web assembly specification document that details the exact standards that need to be followed for wasm.\n\n{manual}\n\nThis document is used as a reference to implement the wasm framework for different environments. Extract all the control flow instructions from the document. Only return the list as output using the following format. output = ['instruction1', 'instruction2', ...]"
    
    return prompt_model(model, prompt)


def get_mapping_instructions_testfiles(model, instructions_list, true_test_filenames):
    prompt = f"You are given a list of instructions, along with a list of tests. You must create a mapping between the list of instructions and the corresponding test files. Output the results as a table with the following format: Index | Instruction | Tests. Any test file that does not map to a instruction should be assigned to the UNKNOWN instruction. Make sure you are thorough and don't leave out any instructions or tests. Here is an example: \n1 | i32.add | add0. Here are the list of instructions: {instructions_list}.\n Here are the list of tests: {true_test_filenames}. Only return the output mapping for the instructions and tests."
    
    return prompt_model(model, prompt)


def extract_manual_instruction_constraints(model, manual, instruction):
    prompt_doc_summary = f"You are an expert in WASM. Here is the official web assembly specification document that details the exact standards that need to be followed for wasm.\n\n{manual}\n\nThis document is used as a reference to implement the wasm framework for different environments. The goal is to find differential tests that returns different outputs in different implementations. Extract the key points relevant to the {instruction} instruction from the documentation. Make sure you are extremely specific, and extract all the constraints and conditions that strictly need to be followed when implementing the {instruction} instruction. The goal is to use these constraints to generate differential tests, so make sure you include details that can be easily missed or misinterpreted so we can test for all misinterpretations and nuances. Do not include example tests."

    return prompt_model(model, prompt_doc_summary)


def extract_relevant_code(model, instruction, instruction_constraints, codefile, implementation):
    prompt_code_extraction = f"You are an expert in WASM. Here is the source code for the wasm code validator implemented in {implementation}.\n{codefile}\n\nHere are the key points relevant to the {instruction} instruction, along with a set of constraints that must be strictly followed when implementing the {instruction} instruction.\n\n{instruction_constraints}\n\nUsing these points as reference, can you extract the relevant code for {instruction} instruction from the code implementation. Only return the relevant code snippets."
    
    return prompt_model(model, prompt_code_extraction)


def generate_differences_from_code_snippets(model, instruction, instruction_constraints, src_code1, src_code2, implementation1, implementation2):
    prompt_code_descriptions_diff = f"You are an expert in WASM. The goal is to find differential tests that returns different outputs in different implementations of wasm. You are provided with the key points relevant to the {instruction} instruction, along with a set of constraints that must be strictly followed when implementing the {instruction} instruction.\n\n{instruction_constraints}\n\nYou are provided with the relevant code implementing the {instruction} instruction in two different implementations. Here is the code implementation for {implementation1}: {src_code1}\n\nHere is the code implementation for {implementation2}: {src_code2}\n\nIdentify differences in the two code implementations and return the output as a list of differences between the two implementations. Use <SEP> tag to separate each difference."
    
    return prompt_model(model, prompt_code_descriptions_diff)


def generate_test_descriptions_from_bug_code_diff(model, instruction, instruction_constraints, code_diff, bug_class, bug_description, implementation1, implementation2):
    prompt_test_descriptions = f"You are an expert in WASM. The goal is to find differential tests that returns different outputs in different implementations of wasm. You are provided with the key points relevant to the {instruction} instruction, along with a set of constraints that must be strictly followed when implementing the {instruction} instruction.\n\n{instruction_constraints}\n\nYou are provided with a list of differences in the code implementations for the {instruction} instruction in two different implementations. Here is a key difference in the way {instruction} instruction was implemented in {implementation1} and {implementation2}: {code_diff}\n\nYour goal is to generate 10 unique differential tests so we can test for this difference in the code implementation for {instruction} instruction in {implementation1} and {implementation2}. Focus on {bug_class} when generating the tests. {bug_description}. Can you generate a natural language description of tests that can result in differential behaviour based on the difference in the code implementations for {instruction} instruction for {bug_class}. Make sure to  reason about the specific constraint that the test is checking for and include information on how the test relates to the {bug_class}. Only provide the list of test descriptions as output. Use <SEP> tag to separate each test description."

    return prompt_model(model, prompt_test_descriptions)


def generate_test_body(model, instruction, instruction_constraints, example_tests, nl_test_description):
    prompt_gen_test = f"You are an expert in WASM. The goal is to find differential tests that returns different outputs in different implementations of wasm. You are provided with the key points relevant to the {instruction} instruction, along with a set of constraints that must be strictly followed when implementing the {instruction} instruction.\n\n{instruction_constraints}\n\nYour goal is to generate differential tests so we can test for nuances in the two implementations of the code validators based on the natural language specifications. Here are some examples of existing tests for various instructions.\n\n{example_tests}\n\nHere is a description of a test that can result in differential behaviour in the two implementations for the {instruction} instruction.\n{nl_test_description}\n\nGenerate the code for the test in the same format as the example. You are required to strictly follow these instructions when generating the test.\n1. Make sure you only generate one test and include the assert_invalid or assert_malformed statement.\n2. Do not include comments in the same line as code.\n\nOnly generate the test code so it can be directly executed, and comment out any natural language descriptions describing what the test does. Only return the code, do not add any formatting."
            
    return prompt_model(model, prompt_gen_test)
     

