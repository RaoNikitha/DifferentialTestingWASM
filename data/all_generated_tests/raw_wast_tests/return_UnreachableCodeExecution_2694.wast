;; 3. **Conditional Return With Unreachable Else**:    - Implement a conditional `return` where the else branch contains an `unreachable` instruction. The true branch should execute `return`.    - This tests if conditional branches correctly handle `return` and do not mislead the control flow to the `unreachable` instruction.

(assert_invalid
  (module
    (func $conditional-return-with-unreachable-else (result i32)
      (if (i32.const 1)
        (then (return (i32.const 42)))
        (else (unreachable))
      )
    )
  )
  "type mismatch"
)