;; 5. **Test Description:**    Simulate an operand that is exactly the maximum integer value to verify correct unwinding to the default label.    - **Specific Constraint:** Operand significantly out-of-bounds should use the default label without causing overflow.    - **Edge Case Relation:** Extremely high values might not be properly caught leading to undefined behavior.

(assert_invalid
  (module (func
    (block (block
      (br_table 0 1 (i32.const 2147483647))
    ))
  ))
  "unknown label"
)