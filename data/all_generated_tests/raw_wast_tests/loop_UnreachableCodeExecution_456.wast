;; 7. **Loop with Unreachable in Untouched Code Path**:    - Insert a loop with branching logic that should theoretically never hit an `unreachable` instruction in a specific branch sequence, but faulty implementation might.    - **Constraint**: Tests the complete coverage of branches to confirm `unreachable` is not mistakenly executed.    - **Unreachable Code Execution**: Verifies unreachable code is only reached due to logic error, not correct operation.

(assert_invalid
  (module (func $test_loop_unreachable
    (block 
      (loop
        (br 0)
        (unreachable)
        (end)
      )
    )
  ))
  "unexpected reachable instruction"
)