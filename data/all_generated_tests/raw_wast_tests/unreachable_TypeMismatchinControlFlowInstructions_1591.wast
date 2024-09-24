;; 2. Create a `loop` that begins by pushing an `i64` value onto the stack and ends with an `unreachable` instruction. Check for type enforcement to ensure the loop cannot end expecting an `i32` value erroneously on the stack exit.

(assert_invalid
  (module (func $loop-unreachable-type-mismatch
    (loop $L
      (i64.const 1)
      unreachable
    )
    (i32.const 0)
  ))
  "type mismatch"
)