;; 3. **Test 3:** Construct a function with conditional blocks nested within each other where the innermost conditional block contains `unreachable`:    - **Check:** Validate that the control flow correctly recognizes the `unreachable` and does not execute subsequent nested conditionals.    - **Constraint:** Ensures `unreachable` behaves correctly even within deeply nested conditionals.

(assert_invalid
  (module
    (func $test3
      (if (i32.const 1)
        (then
          (if (i32.const 1)
            (then
              (if (i32.const 1)
                (then
                  (unreachable)
                  (i32.const 0)
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)