;; 8. Implement a test where two functions are added to the table with similar but not identical function signatures. A correct `call_indirect` should fail if the expected type by `typeidx` does not perfectly match the invoked function type.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (type $sig1) (param i32) (result i32) (i32.const 42))
    (func $func2 (type $sig2) (param i32))
    (func (call_indirect (type $sig1) (i32.const 1) (i32.const 0)))
  )
  "type mismatch"
)