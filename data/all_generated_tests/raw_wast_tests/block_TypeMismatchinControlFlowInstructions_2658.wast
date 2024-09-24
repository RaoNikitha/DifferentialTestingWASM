;; Test 9: Define a block with the type that produces both i32 and f32 results. In the `br_table` instruction, have entries that do not respect the specified type signature and verify if the type mismatch is correctly flagged.

(assert_invalid
  (module (func $block-multi-result-type-br_table (result i32 f32)
    (block (result i32 f32)
      (br_table 0 1 2 (i32.const 0) (f32.const 0.0))
    )
  ))
  "type mismatch"
)