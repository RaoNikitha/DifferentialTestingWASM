;; 7. Test interactions between the `return` instruction and local variables in functions. Place a `return` instruction after initializing and manipulating local variables, ensuring that the instruction correctly unwinds the operand stack and does not corrupt local variable states.

(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-local (param i32 i32) (result i32)
      (local.get 0) (local.get 1)
      (i32.add)
      (return))
  )
  "type mismatch"
)