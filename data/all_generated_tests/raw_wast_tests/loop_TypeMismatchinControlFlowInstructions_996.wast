;; 7. **Indirect Branch through `br_table` with Type Violation**:    - A `br_table` within a loop that indexes into a label table incorrectly assigning types.    - This tests if `br_table` correctly validates operand types matching target labels within loops.    - Specific Constraint: Proper validation of types in `br_table` targets within loops.

(assert_invalid
  (module (func $br-table-loop-type-mismatch 
    (loop (result i32)
      (block (result i64)
        (br_table 0 0 (i32.const 0))
      )
    )
  ))
  "type mismatch"
)