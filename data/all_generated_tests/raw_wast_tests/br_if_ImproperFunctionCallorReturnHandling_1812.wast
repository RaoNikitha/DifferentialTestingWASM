;; 3. **Test Description:** Create a nested control flow where a `br_if` condition triggers a function return. Validate that the operand stack is properly unwound before the function returns.    - **Constraint:** Ensures stack state is correctly maintained and unwound.    - **Improper Handling:** Incorrect stack unwinding could return incorrect values.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (block (result i32)
          (br_if 0 (i32.const 0))
          (return (i32.const 2))
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)