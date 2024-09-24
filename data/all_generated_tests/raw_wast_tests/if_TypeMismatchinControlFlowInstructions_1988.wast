;; 9. **Test Description**:    - Configure an `if` block type to be `[] -> [i32]`, with the `then` branch generating a float value `f64`.    - **Constraint Checked**: Checking type mismatch when a scalar value type differs from the block type's expectations.    - **Target**: Validate the robustness of type safety enforcement in control flow instructions.

(assert_invalid
  (module (func $test-if-type-mismatch (result i32)
    (if (result i32) (i32.const 1) 
      (then (f64.const 1.0)) 
    )
  ))
  "type mismatch"
)