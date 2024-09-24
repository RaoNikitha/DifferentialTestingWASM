;; 9. **Test for Proper Operand Stack Management**:    - Verify an `if` condition dependent on an imported function call in which the function manipulates the operand stack still upholds the expected condition and stack state when returning control to the host module.    - **Constraint Focus**: Validates operand stack management around imported function calls.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $test (result i32)
      (if (result i32)
        (call $imported_func)
        (then (i32.const 1))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)