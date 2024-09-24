;; 8. **Test Case 8: Mix of arithmetic operations and `nop` leading to `unreachable`:**    - **Constraint Checked:** Ensuring computations remain unaffected by `nop`, leading to `unreachable`.    - **Expected Behavior:** Proper arithmetic followed by a trap upon reaching `unreachable`.    - **Differential Behavior:** Stack mismanagement in wizard_engine could alter final execution path.

(assert_invalid
  (module
    (func $test (result i32)
      (i32.const 10)
      (i32.const 20)
      (i32.add)
      (nop)
      (unreachable)
    )
  )
  "unreachable executed"
)