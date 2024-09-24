;; 6. **Test 6**:    - **Description**: Test an `if` block where a function call within the `then` branch returns a value used in an outer block calculation before the `end`.    - **Constraint**: Ensure the function's return value is correctly passed back and affects outer block computations as intended.    - **Relation**: Checks the stack behavior for function returns and their integration with outer block logic.

(assert_invalid
  (module
    (func $test_func (result i32)
      (i32.const 42)
    )
    (func (result i32)
      (if (result i32)
        (i32.const 0)
        (then
          (call $test_func)
        )
        (else
          (i32.const 1)
        )
      )
      (i32.add)  ;; Attempt to add the result of the if condition with top of stack
    )
  )
  "type mismatch"
)