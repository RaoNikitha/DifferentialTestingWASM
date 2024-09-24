;; 3. **Test Description**: Call a function that returns multiple values and ensure they are correctly pushed onto the stack.    - **Constraint Checked**: Ensures the function returns the correct types and number of values according to its signature.    - **Improper Handling**: Detects issues where returned values might not be placed correctly, potentially corrupting subsequent operations.

(assert_invalid
  (module
    (func $multi_return (result i32 f64)
      (i32.const 42) (f64.const 3.14)
    )
    (func (call $multi_return))
  )
  "type mismatch"
)