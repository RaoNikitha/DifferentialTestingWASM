;; **Test 3**: Inside a loop, have a condition that triggers an early `return` followed by `unreachable`. If the condition is met, `unreachable` should not be reached. *Constraint Checking*: Validates correct control flow out of a loop upon `return`.

(assert_invalid
  (module
    (func $test-loop-return-unreachable
      (loop
        (i32.const 0)
        (br_if 0 (return (i32.const 42)))
        (unreachable)
      )
    )
  )
  "type mismatch"
)