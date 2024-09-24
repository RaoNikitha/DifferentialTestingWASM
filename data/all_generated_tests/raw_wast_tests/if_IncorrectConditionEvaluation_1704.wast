;; 5. Test an `if` instruction that needs to evaluate the top of the operand stack for its condition, where `WebAssembly Validator` branches correctly, but the `Wizard Engine` mismanages the stack and branches incorrectly.

(assert_invalid
  (module (func $type-condition-operand-stack (result i32)
    (if (result i32) (i64.const 0)
      (then (i32.const 1))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)