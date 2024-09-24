;; 10. **Test 10: Multiple Tables with Mixed Types**:    Define multiple tables; one properly typed and another with mixed types. Switch between these tables using `call_indirect` and observe how each instruction manages the stack and handles any resultant stack corruption or traps.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i64) (result i64)))
    (table 1 funcref)
    (table 1 funcref)
    (element (i32.const 0) $f1)
    (func $f1 (type $sig1) (i32.const 42))
    (func $f2 (type $sig2) (i64.const 84))
    (func (result i32)
      (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
      (call_indirect (type $sig2) (i32.const 0) (i64.const 0))
    )
  )
  "type mismatch"
)