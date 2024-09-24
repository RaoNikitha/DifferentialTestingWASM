;; 6. Test a `call_indirect` where the function in the table expects 3 inputs but only provide 2, ensuring stack underflow is caught, and no residual data is left on the stack post-trap.

(assert_invalid
  (module
    (type (func (param i32 i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32 i32 i32))
    (func (call_indirect (type 0) (i32.const 0) (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)