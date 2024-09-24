;; 6. **Test Complex Branch Table with Blocks**:    - Implement a branch table (`br_table`) inside a block with multiple case labels targeting different blocks.    - **Reasoning**: This tests the CFG's capability to handle complex branch tables that affect different levels of nested blocks.    - **Purpose**: Verify the CFG accurately represents complex branching scenarios.

(assert_invalid
  (module
    (func $complex-br-table-block
      (block $outer (block $inner
        (block $exit (br_table $exit $inner $outer (i32.const 0)))
        (i32.const 1) (drop)
      ))
      (i32.const 2) (drop)
    )
  )
  "type mismatch"
)