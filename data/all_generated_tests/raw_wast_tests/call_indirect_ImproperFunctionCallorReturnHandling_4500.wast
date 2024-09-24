;; 9. Test a function defined to return multiple values which are then called through `call_indirect`, to validate that the return values are correctly pushed back onto the operand stack for subsequent operations.

(assert_invalid
  (module
    (type (func (result i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) func $func-name)
    (func $func-name (result i32 i32) (i32.const 42) (i32.const 24))
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)