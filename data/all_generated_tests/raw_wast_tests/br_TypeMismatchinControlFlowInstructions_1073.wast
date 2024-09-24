;; 4. Set up a function with a block that takes a tuple (int, float) as the result type. Use the `br` instruction inside to branch out, but only place an integer on the operand stack. This checks if the invalid tuple result type mismatch is caught correctly.

(assert_invalid
  (module (func
    (block (result i32 f32)
      (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)