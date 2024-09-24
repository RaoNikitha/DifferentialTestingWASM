;; 2. **Nested `if` with `br_table` Misinterpretation**: Create a nested `if` block within another `if` block, with a `br_table` instruction inside the inner `if`. This tests if the `br_table` correctly interprets the depth of nesting, ensuring the control flow jumps to the appropriate block.

(assert_invalid
  (module
    (func $nested-if-br-table
      (i32.const 1)
      (if (then
        (i32.const 2)
        (if (then
          (i32.const 0)
          (br_table 0 1)
        ))
      ))
    )
  )
  "type mismatch"
)