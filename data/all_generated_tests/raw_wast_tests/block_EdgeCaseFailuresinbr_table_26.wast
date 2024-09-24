;; 7. Test with multiple `block`s ending with a `br_table` targeting an empty block:    - Including multiple `block`s, the final block contains a `br_table` targeting a block without any operations (empty).    - Specific Constraint: Verifies that branches targeting empty blocks are resolved correctly.    - Edge Case: Ensures stack restoration is correctly managed even for empty (no operation) blocks.

(assert_invalid
  (module
    (func $test-block-br_table-empty-target
      (block (result i32)
        (i32.const 1)
        (block
          (block
            (br_table 0 1 2 (i32.const 0))
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)