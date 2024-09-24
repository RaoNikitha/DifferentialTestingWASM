;; 3. **Mismatched Stack Types Inside `if`**:    - **Focus**: Stack corruption due to type mismatch.    - **Description**: Within the `if` and `else` blocks, manipulate the stack with differing data types. Verify both branches correctly maintain type consistency according to the block type.

(assert_invalid
  (module (func $mismatched-stack-types (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1) (f64.const 0.0) (drop) (i32.const 2))
      (else (i32.const 3))
    )
  ))
  "type mismatch"
)