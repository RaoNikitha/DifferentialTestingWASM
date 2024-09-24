;; Test 6: A `block` instruction preceding a `loop` that ends with a floating-point value on the stack, but the subsequent `loop` instruction expects an integer type for its input.

(assert_invalid
  (module
    (func
      (block (f32.const 5.5)
        (loop (param i32)
          (drop))
      )
    )
  )
  "type mismatch"
)