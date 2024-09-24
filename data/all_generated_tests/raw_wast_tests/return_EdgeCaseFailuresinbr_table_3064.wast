;; 3. **Test Description**: A function with a `br_table` that includes an index exceeding the number of targets, resulting in the default target execution that contains a `return` instruction.    - **Constraint**: Ensures `return` behaves correctly when the `br_table` index is out-of-bounds.

(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-br_table (result i32)
      (i32.const 0) (i32.const 1) (i32.const 2)
      (block (result i32)
        (br_table 0 1 2 3 (return))
      )
    )
  )
  "type mismatch"
)