;; 4. **Test Case: Unreachable Before Function End**    - Description: Place an `unreachable` instruction right before the end of a function and return statement to verify that no return is executed.    - CFG Constraint: Testing the control flow interruption just before a return statement to ensure the function termination sequence is correctly handled.

(assert_invalid
  (module
    (func
      (unreachable)
      (return (i32.const 42))
    )
  )
  "type mismatch"
)