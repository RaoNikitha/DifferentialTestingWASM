;; 5. **Test Description**: A function utilizing `br_table` where all target blocks have different return types and a `return` instruction at the end of each block.    - **Constraint**: Checks type validation and polymorphic stack management across multiple return types.

(assert_invalid
  (module
    (func $br_table_return_types (param i32) (result i32)
      (block $block0 (result i32)
        (block $block1 (result i32)
          (block $block2 (result f32)
            (block $block3 (result i64)
              (block $block4 (result f64)
                (br_table 0 1 2 3 4 (local.get 0))
              )
              (return)
            )
            (return)
          )
          (return)
        )
        (return)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)