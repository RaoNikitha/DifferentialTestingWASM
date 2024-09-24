;; 2. **Invalid Branch Type Matching**: Within a `block` that expects a `f32` as its result type, insert a `br` instruction to a label that ends up producing a `i32` instead. This tests the handling of type mismatch during branching.

(assert_invalid
  (module (func $invalid-branch-type-matching-block (result f32)
    (block (result f32)
      (br 0 (i32.const 42))
      (f32.const 3.14)
    )
  ))
  "type mismatch"
)