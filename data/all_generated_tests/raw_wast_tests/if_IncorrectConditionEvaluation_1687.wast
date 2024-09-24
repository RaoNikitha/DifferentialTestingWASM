;; 8. **Test `if` Instruction Inside Loop Construct**:    - Description: An `if` instruction inside a loop where loop continues based on the `if` condition evaluating non-zero.    - Constraint: Confirms looping control flow is preserved correctly based on if condition.    - Incorrect Condition Evaluation: Check if Wizard Engine improperly handles `if` condition within loop causing incorrect loop termination or continuation.

(assert_invalid
  (module (func $test-loop-if
    (loop $outer
      (if (result i32) (i32.const 1)
        (then
          (br_if $outer (i32.const 1))
        )
      )
    )
  ))
  "type mismatch"
)