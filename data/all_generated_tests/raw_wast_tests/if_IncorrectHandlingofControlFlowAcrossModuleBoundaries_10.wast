;; 1. **Test Description**: Validate an `if` block within a function that calls an imported function and relies on the return value for the `if` condition. If the control flow doesn't handle the cross-module return properly, the `if` condition may be corrupted.    - **Constraint Checked**: Proper management of operand stack across module boundaries.    - **Test Relation**: Ensures the stack is correctly maintained when control returns from an imported function.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test-if-across-module-boundary (result i32)
      (if (result i32) 
        (call $external_func) 
        (then (i32.const 1)) 
        (else)))
  )
  "type mismatch"
)