;; 1. **Test 1: `br_table` with Out-of-Bounds Operand**    - Description: A `br_table` is executed with an operand value that is out of bounds, triggering the default label. The test will validate whether the default branching is correctly managed in both implementations.    - Specific Constraint: Checks if the default label is correctly targeted when the operand index is out of range.    - Infinite Loop Relation: If the default label is misconfigured, an infinite loop could occur due to improper branching.

(assert_invalid
  (module
    (func $br_table_out_of_bounds
      (block $label0 
        (block $label1
          (br_table 0 0 (i32.const 10))
        )
      )
    )
  )
  "unknown label"
)