;; 3. **Test 3: Nested Blocks with `br_table`**    - Description: Use `br_table` within nested blocks to see how both engines handle the operand stack and labels' relative indexing.    - Specific Constraint: Ensures correct branching to relative labels within nested structures.    - Infinite Loop Relation: Incorrect nesting or misinterpretation of relative indices can lead to improper exits from loops, causing an infinite loop.

(assert_invalid
  (module
    (func $nested-blocks-with-br_table
      (block
        (block
          (block
            (br_table 0 1 2 (i32.const 3))
          )
        )
      )
    )
  )
  "unknown label"
)