;; Test 10: Execute a `br_table` with multiple labels where each label's operand sequence type is validated strictly against the block type's expected operand configuration. Ensure that mismatches are caught accurately and traced to the respective condition evaluation in branch decision.

(assert_invalid
  (module 
    (func (result i32)
      (block (result i32)
        (block (result f32)
          (block (result i64)
            (br_table 0 1 2 (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)