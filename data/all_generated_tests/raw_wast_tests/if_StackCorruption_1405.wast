;; Construct an `if` instruction where both `then` and `else` blocks try to push operands without proper checking of the input operand type at the start, testing consistency in operand type validation.

(assert_invalid
 (module
  (func
   (if (i32.const 1)
    (then
     (i32.const 1)
     (i32.const 2)
     (drop)
    )
    (else
     (f32.const 1.0)
     (f32.const 2.0)
     (drop)
    )
   )
  )
 )
 "type mismatch"
)