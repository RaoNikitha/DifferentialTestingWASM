;; 8. Define a block that expects an `i32` output but ends with a `return` instruction that attempts to provide an `i64` value. This ensures type mismatches are captured at the point of returning from blocks.

(assert_invalid
  (module (func $block-return-type-mismatch (result i32)
    (block (result i32)
      (i64.const 1)
      return
    )
  ))
  "type mismatch"
)