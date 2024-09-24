;; 5. **Test: Indexed Labels with Unmatched Length**    - **Description:** Use a `br_table` where the label indices vector has different lengths of operand sequences.    - **Constraint:** Confirms consistency in operand type lengths for all label targets.    - **Relation to Stack Corruption:** Ensures the stack is not mismatched or corrupted due to length differences.

(assert_invalid
  (module
    (func $unmatched-label-lengths
      (block (result i32)
        (block (result i32 i32)
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)