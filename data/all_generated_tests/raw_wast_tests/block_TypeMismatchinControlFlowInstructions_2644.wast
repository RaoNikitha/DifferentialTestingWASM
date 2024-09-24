;; 5. Design a block that expects an `i64` type, then includes a `br` instruction targeting the block with an `f32` value. This is to check if type mismatches through indirect branching are correctly handled by both implementations.

(assert_invalid
  (module (func $type-block-and-branch-mismatch (result i64)
    (block (result i64) (br 0 (f32.const 1.0)) (i64.const 42))
  ))
  "type mismatch"
)