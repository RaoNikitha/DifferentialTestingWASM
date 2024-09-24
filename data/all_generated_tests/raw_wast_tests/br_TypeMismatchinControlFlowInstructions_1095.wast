;; 6. A deeply nested block structure with mixed result expectations (e.g., alternating `i32` and `f32` results) and a `br` instruction targeting an incorrect level, leading to mismatched types on the operand stack.

(assert_invalid
  (module
    (func $deeply-nested-blocks
      (block (result i32)
        (block (result f32)
          (block
            (br 2) ;; Incorrect level, should cause type mismatch
            (i32.const 42))) ;; i32 type while br expects f32
        (f32.const 1.0))
      (i32.const 0))
    )
  )
  "type mismatch"
)