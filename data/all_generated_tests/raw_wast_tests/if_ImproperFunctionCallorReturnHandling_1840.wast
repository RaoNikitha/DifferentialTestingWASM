;; 1. **Test 1**:    - **Description**: Validate the execution of a simple `if` block that calls a function to return a value based on an `i32` condition.    - **Constraint**: Ensure the function call within the `if` block correctly returns the expected value when the condition is true.    - **Relation**: This test checks if the `if` block correctly handles function calls and return values based on the condition input.

(assert_invalid
  (module
    (func $return_input (param i32) (result i32) (local.get 0))
    (func $test_if_function_call
      (i32.const 1)
      (if (result i32)
        (then (call $return_input (i32.const 42)))
        (else (call $return_input (i32.const 0)))
      )
    )
  )
  "type mismatch"
)