;; 1. Test a call to a function that consumes more arguments than exist on the stack. This checks for stack underflow and whether the implementation can correctly handle empty value stack expectations.

(assert_invalid
  (module
    (func $underflow (call 1))
    (func (param i32) (param i32) (result i32) (i32.add))
  )
  "type mismatch"
)