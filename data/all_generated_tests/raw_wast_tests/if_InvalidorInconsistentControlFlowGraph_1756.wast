;; 7. **Test `if` Condition with Stack Underflow**:    - Create an `if` condition that attempts to pop more arguments than available on the stack, checking for proper CFG validation catching stack underflow errors.    - **Constraint Checked**: ensures CFG handles stack underflow conditions effectively.

(assert_invalid
  (module
    (func $test_stack_underflow
      ;; Creating a scenario where the stack underflow happens
      ;; Condition evaluation requires an i32, another i32 is already required for executing the inner instruction
      (if (then (i32.const 1) (i32.add)))
    )
  )
  "type mismatch"
)