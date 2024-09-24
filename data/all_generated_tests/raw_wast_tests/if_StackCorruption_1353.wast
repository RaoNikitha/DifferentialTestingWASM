;; 4. **Test 4**: Create an `if` instruction where both `then` and `else` branches terminate with `return`, but they manipulate different operand counts on the stack. Violating blocktype constraints deliberately should help identify overflow or underflow caused by improper stack management between returns.

(assert_invalid
  (module (func $type-stack-manipulation (result i32)
    (if (result i32)
      (i32.const 1)
      (then
        (drop)
        (return (i32.const 1) (i32.const 2))
      )
      (else
        (return (i32.const 3))
      )
    )
  ))
  "type mismatch"
)