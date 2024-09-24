;; 7. Create a block that should yield an `i32` result, but incorporates a `br_if` instruction where the conditional check concludes with an `f32` type. This tests whether both implementations correctly enforce type constraints on conditionals within blocks.

(assert_invalid
  (module (func $type-block-br_if-f32-vs-i32 (result i32)
    (block (result i32)
      (br_if 0 (f32.const 1.0) (i32.const 0))
    )
  ))
  "type mismatch"
)