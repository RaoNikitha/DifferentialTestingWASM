;; A nested `loop` structure inside a `block` where the inner loop has a `br` instruction targeting the outer `block`. This scenario tests whether the operand stack is properly managed when an unconditional branch skips over multiple nested structures.

(assert_invalid
  (module
    (func
      (block (result i32)
        (loop
          (i32.const 1)
          (br 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)