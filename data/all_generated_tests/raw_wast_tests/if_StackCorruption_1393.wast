;; 4. **Invalid Input Type to `if` Condition**:    - **Focus**: Invalid type for if condition check.    - **Description**: Provide a non-`i32` type on the stack before executing `if`. This tests the system’s handling of improper type conditions.

(assert_invalid
  (module
    (func $invalid-if-condition-type
      (f32.const 1.0)
      (if (result i32) (then (i32.const 42)) (else (i32.const 0)))
    )
  )
  "type mismatch"
)