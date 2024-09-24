;; 5. **Test Description**: Define a `block` with the expected result type `[i32]` and include a `br_table` instruction targeting this block, where the `br_table` erroneously resolves to `[f32]`. Test if the branching logic within the block properly checks and fails on type mismatches.

(assert_invalid
  (module (func $br_table_type_mismatch (result i32)
    (block (result i32)
      (i32.const 0)
      (i32.const 1)
      (br_table 0 (f32.const 1.0))
    )
  ))
  "type mismatch"
)