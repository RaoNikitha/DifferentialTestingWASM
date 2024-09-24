;; 7. **Test: Multiple Target Labels with Mixed Type Expectations**    - **Description**:      A `br_table` instruction with multiple target labels; some expecting `i32`, some expecting `f64`, but only `i32` is provided.    - **Constraint Checked**:      Validates multiple label type expectations and mismatches.    - **Related Type Mismatch**:      Handling of varied type requirements across multiple labels.

(assert_invalid
  (module
    (func $mixed-label-types
      (block
        (block (result i32) (block (result f64) 
          (br_table 0 1 (i32.const 0) (f64.const 0.0))
        ))
        (drop)
      )
    )
  )
  "type mismatch"
)