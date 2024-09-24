;; 2. **Test Description:**    Test br_table with an operand of zero and only one label in the vector, ensuring it correctly branches to the only available label.    - **Specific Constraint:** Ensures correct indexing from the stack and the lowest boundary condition.    - **Edge Case Relation:** Incorrect handling of minimal cases could result in errors of bounded input handling.

(assert_invalid
  (module (func $test-br_table-operand-zero
    (block
      (br_table 0 (i32.const 0)) (i32.const 1)
    )
  ))
  "unknown label"
)