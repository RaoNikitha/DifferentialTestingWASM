;; Embed a `nop` instruction after a `call` but before any subsequent instruction to ensure the return value of the called function is correctly handled and passed to the next instruction, ensuring `nop` does not interfere with return value processing.

(assert_invalid
  (module
    (func (result i32)
      (call $some_func)
      (nop)
    )
  )
  "type mismatch"
)