;; 5. **Test 5: br_table with Varying Depths of Nested Blocks**    - **Description:** Nested blocks using a `br_table` instruction with branch targets at different depths of the nested blocks.    - **Constraint:** Ensures the correct mapping of `br_table` index targets to the appropriate block depths.    - **Mismanagement Check:** Misinterpretation of depth causing control flow to erroneously exit to an incorrect block level.

(assert_invalid
  (module
    (func $test_br_table (result i32)
      (block $outer (result i32)
        (block $middle (result i32)
          (block $inner
            (br_table 2 1 0 (i32.const 0))
          )
          (i32.const 10)
        )
      )
    )
  )
  "type mismatch"
)