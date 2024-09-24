;; 7. **Test Description**:     Test a loop with `br_table` where the target labels themselves include further `br_table` instructions, forming a recursive-like branching sequence. Indices in the initial `br_table` should include out-of-range values, testing cascading defaults.    **Constraint**: Ensure recursive-like branching sequences are correctly handled with out-of-range indices.    **Relation to `br_table` Edge Cases**: Tests complex label lookup chains and the correctness of iterative default fallbacks.

(assert_invalid
  (module
    (func $recursive-br-table
      (block
        (loop
          br_table 0 1 2 3 (i32.const 4)  ; Initial br_table targeting various labels
        )
        br_table 0 2 1 (i32.const 1)      ; Nested br_table within the first target block
      )
    )
  )
  "type mismatch"
)