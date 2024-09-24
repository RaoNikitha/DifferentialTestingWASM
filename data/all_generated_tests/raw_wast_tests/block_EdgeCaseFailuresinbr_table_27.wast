;; 8. Test with a `block` using `br_table` and indexes pre-populated with operations on the stack:    - Populate an operand stack with values before invoking a `br_table` inside a `block` with arbitrary indices.    - Specific Constraint: Tests the resolution of pre-existing stack entries post-branch execution.    - Edge Case: Ensures stack integrity and correctness of operand restoration after branching.

(assert_invalid
  (module
    (func $block_with_br_table
      (i32.const 0)
      (i32.const 1)
      (block (result i32)
        (br_table 0 1 2 (i32.const 0))
        (return)
      )
      (drop)
    )
  )
  "type mismatch"
)