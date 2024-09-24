;; - Develop a `loop` structure containing a `call` instruction that cycles back through the same loop. Ensure proper handling of the operand stack, checking for consistent function returns and stack unwinding.

(assert_invalid
  (module
    (func $loop-with-call
      (loop (result i32)
        (call $recur_func)
        (br 0)
      )
    )
    (func $recur_func (result i32)
      (i32.const 1)
    )
  )
  "type mismatch"
)