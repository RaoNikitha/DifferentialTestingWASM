import re
import pandas as pd


def main():

    # load constraints
    constraints = pd.read_json("../context/control_flow_constraints.json")
    print(constraints)

    human_written_tests_path = '../human_written_tests/WebAssembly/processed_control_flow_validation'

    for i, row in constraints.iterrows():
        instruction = row['instruction']
        
        # Read the input .wast file
        with open(f'{human_written_tests_path}/{instruction}.wast', "r") as file:
            content = file.read()

        # Regular expression to match individual test cases
        test_pattern = re.compile(r"(\(assert_\w+.*?\n\))", re.DOTALL)

        # Find all matches
        tests = test_pattern.findall(content)

        # Save each test to a separate file
        for i, test in enumerate(tests, 1):
            with open(f"{human_written_tests_path}/test_{instruction}_{i}.wast", "w") as file:
                file.write(test)
        
        

if __name__ == "__main__":
    main()


# to run file
# python3 -u main_separate_human_tests.py 2>&1 | tee output_separate_human_tests.txt
