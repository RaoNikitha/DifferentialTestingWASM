;; 5. A `loop` instruction where the body ends with `nop` and the succeeding instructions rely on specific operand types being present in the stack.

(assert_invalid
  (module
    (func $loop-nop (param i32) (result i32)
      (local.get 0)
      (loop $L1 (result i32)
        (local.get 0)
        nop
      )
      nop
    )
  )
  "type mismatch"
)