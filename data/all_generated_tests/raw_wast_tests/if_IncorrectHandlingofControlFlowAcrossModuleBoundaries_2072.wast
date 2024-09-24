;; 3. **Test for Proper Unwinding on Function Call Failure**:    - Simulate a failing imported function within an `if` block and verify that the stack unwinds correctly, ensuring the `else` block can execute correctly if the function call throws an error.    - **Constraint Focus**: Validates unwinding mechanism on cross-module function call failures.

(assert_invalid
  (module
    (import "env" "failing_func" (func $failing_func (param i32)))
    (func $test_unwind (result i32)
      (i32.const 0)
      (if (result i32)
        (then
          (call $failing_func (i32.const 1))
          (i32.const 1)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)