;; **Test 4**: Using conditional branches, have a scenario where `return` is called within an `if` branch and `unreachable` is placed outside the `if` block. Ensure `unreachable` is only executed if the condition fails. *Constraint Checking*: Tests handling of conditional branches and correct path termination.

(assert_invalid
  (module
    (func $conditional_return (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (return))
      (unreachable)
    )
  )
  "type mismatch"
)