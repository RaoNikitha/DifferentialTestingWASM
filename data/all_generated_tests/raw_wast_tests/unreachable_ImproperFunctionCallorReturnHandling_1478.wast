;; 9. **Test 9: Unreachable Within if-Else Structure and Function Calls**    - Description: Use `unreachable` within one branch of an `if-else` that also includes function calls in both branches.      - *Constraint:* Ensures the correct branch termination due to `unreachable`.      - *Improper Handling Check:* Ensures conditional structures and their embedded function calls resolve correctly with `unreachable`.

(assert_invalid
  (module
    (func $diff_test_if_else_unreachable
      (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call $some_func)
          (unreachable)
        )
        (else
          (call $another_func)
          (i32.const 42)
        )
      )
    )
    (func $some_func (result i32) (i32.const 0))
    (func $another_func (result i32) (i32.const 1))
  )
  "type mismatch"
)