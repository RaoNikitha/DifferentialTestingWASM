;; 10. **Test `if` Instruction with Return and No Else Branch**:    - Description: Execute an `if` instruction where the true branch includes a return, but the false branch skips directly to end without an `else`.    - Constraint: Verifies that return unwinds and affects control flow correctly without needing an `else`.    - Incorrect Condition Evaluation: Test for Wizard Engine mishandling true branch return leading to incorrect continuation past `end`.

(assert_invalid
  (module
    (func $test_return_no_else (result i32)
      (if (i32.const 1)
        (then (return (i32.const 42)))
      )
      (return (i32.const 0))
    )
  )
  "type mismatch"
)