;; 3. Use `nop` before and after a `call` instruction that consumes and produces multiple values on the stack to ensure that the `nop` instructions do not interfere with the argument consumption and result production of the function call.

(assert_invalid
  (module
    (func $consume_produce (param i32 i32) (result i32 i32)
      (nop)
      (call $consume_produce)
      (nop)
    )
  )
  "type mismatch"
)