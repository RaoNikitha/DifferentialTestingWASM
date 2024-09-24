;; 9. **Test: BrTable with Mismatched Types in If Construct**    - **Description**:      A `br_table` inside an `if` construct where true branch label expects `i32`, and false branch expects `f32`, but the stack provides `i32`.    - **Constraint Checked**:      Ensures correct type handling in conditionally branched `br_table` instructions.    - **Related Type Mismatch**:      Type mismatch in conditional branching scenarios.

(assert_invalid
  (module (func $brtable_mismatched_types_if (param i32) (param f32) (result i32)
    (block (result i32)
      (if (result f32)
        (i32.const 0)
        (block (result f32)
          (i32.const 1)
          (br_table 0 1 (local.get 0))
        )
      )
    )
  ))
  "type mismatch"
)