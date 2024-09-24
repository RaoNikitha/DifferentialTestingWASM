;; 4. **Test Description**: A deeply nested set of blocks terminated by `br_table` with varying indices, followed by `return` instructions in inner blocks to test proper return type validation.    - **Constraint**: Tests nested `return` instruction behavior with indirect branching.

(assert_invalid
  (module
    (func $test_nested_blocks_return (result i32)
      (block $outer
        (block $inner
          (br_table 0 1 (return))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)