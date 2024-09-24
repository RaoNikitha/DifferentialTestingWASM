;; 9. **Test Description:**    - Integrate `unreachable` at the end of a function’s body following compounded `if` statements with evaluations that lead to false. The function should exit normally when conditions are false without `unreachable`.    - Constraint: Full function body, conditional verification.    - Relation to Incorrect Condition Evaluation: Ensures ending condition resolutions are correctly handled.

(assert_invalid
  (module (func $conditional-unreachable
    (block
      (if (i32.const 0)
        (then)
        (else (i32.const 1))
      )
    )
    (unreachable)
  ))
  "type mismatch"
)