;; 2. **Excess Stack Elements**:    - **Focus**: Stack overflow before the `if` instruction.    - **Description**: Push several elements onto the stack and then execute an `if` instruction with a correct `i32` condition. Verify if the stack height is properly managed afterward.

(assert_invalid
  (module
    (func $excess-stack-elements
      (i32.const 0)
      (f64.const 1.0)
      (if (result i32) (i32.const 1)
        (then (i32.const 2))
        (else (nop))
      )
    )
  )
  "type mismatch"
)