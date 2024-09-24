;; 1. Test a function call with an excessive number of arguments to check if an `ArityMismatch` error is correctly raised. Verify whether different engines trigger the error at function call time due to improper argument handling.

(assert_invalid
  (module
    (func (result i32) (param i32 i32) (i32.add (local.get 0) (local.get 1)))
    (func (result i32) (i32.const 42) (call 0 (i32.const 1) (i32.const 2) (i32.const 3)))
  )
  "type mismatch"
)