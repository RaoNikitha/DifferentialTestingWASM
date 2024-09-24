;; 6. Perform `call_indirect` with boundary value parameters to an imported function, checking if the operand stack and return values between modules are properly aligned and control flow is handled without corruption.

(assert_invalid
  (module
    (type (func (param i32)))
    (import "env" "imported_func" (func $imported (type 0)))
    (table funcref 1 (elem $imported))
    (func $test
      (call_indirect (type 0) (i32.const 1) (i32.const 65536))
    )
  )
  "index out of bounds"
)