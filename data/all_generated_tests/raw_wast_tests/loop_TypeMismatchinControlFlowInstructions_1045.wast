;; Test 6: A `loop` instruction expecting an `f64` result, followed by an `if` statement that incorrectly produces an `i32` when the condition is met. This checks for type misalignment in control flow paths involving conditional instructions within loops.

(assert_invalid
  (module
    (func
      (loop (result f64)
        (i32.const 0)
        (if (result f64) (i32.const 1) (f64.const 2.0))
      )
    )
  )
  "type mismatch"
)