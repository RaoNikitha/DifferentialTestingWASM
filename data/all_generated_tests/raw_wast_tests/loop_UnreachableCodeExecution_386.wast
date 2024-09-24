;; 7. **Conditional Unwind Leading to Unreachable**:    In a loop, use conditional unwinding of the operand stack to a state leading to an `unreachable` instruction, checking if unwinding mishandles lead to incorrect targeting.

(assert_invalid
  (module (func
    (i32.const 0)
    (loop (result i32)
      (br_if 0 (unreachable))
    )
  ))
  "type mismatch"
)