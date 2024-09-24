;; 9. Develop a function where a `nop` instruction is placed before a conditional branch that tests a flag on the stack. Verify if different interpretations of the `nop` instruction affect the flag testing and subsequent branching.

(assert_invalid
  (module
    (func
      (local i32)
      (i32.const 0)
      (nop)
      (if (result i32)
        (i32.const 1)
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)