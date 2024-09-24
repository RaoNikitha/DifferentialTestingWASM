;; 6. **Test for Stack Height Matching**:    - Check if an imported function call within an `if` condition ensures the stack matches the expected height by the time execution returns to the host module after the imported function finishes execution.    - **Constraint Focus**: Verifies stack height alignment after cross-boundary function calls.

(assert_invalid
  (module
    (func $test-condition-stack-height
      (if (result i32 i32)
        (call 0) (then (i32.const 0) (i32.const 1))
        (else (i32.const 2) (i32.const 3))
      )
    )
    (func (import "env" "imported_func") (result i32))
  )
  "type mismatch"
)