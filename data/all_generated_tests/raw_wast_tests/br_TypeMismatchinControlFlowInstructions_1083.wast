;; 4. Have a `loop` expecting an input type of `i32`, but an inner `block` contains a `br` instruction that incorrectly jumps with an `f32` value. This tests the proper validation of operand types when looping back to the start of a loop.

(assert_invalid
  (module
    (func
      (loop (param i32)
        (block
          (f32.const 1.0)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)