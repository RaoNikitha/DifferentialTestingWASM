;; 4. **Test: Deeply Nested Blocks**    - **Description:** Place a `br_table` within several nested blocks, each with different stack configurations.    - **Constraint:** Ensures label indexing correctly handles nesting and relative label indices.    - **Relation to Stack Corruption:** Tests correct target resolution and stack unwinding across nested blocks.

(assert_invalid
  (module (func $deeply-nested-blocks
    (block (result i32)
      (block
        (block
          (block
            (block (result i32) (br_table 0 1 2 3 (i32.const 1)) (i32.const 42))
          )
          (i32.const 0)
        )
        (i32.const 0)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)