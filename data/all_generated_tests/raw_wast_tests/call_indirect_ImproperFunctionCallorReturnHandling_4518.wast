;; 7. Design a scenario where an indirect call is made through `call_indirect` with all required parameters on the stack, but the return type does not match the expected result type, thus trapping due to return value type mismatch.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i64)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32) (i32.const 0))
    (func $test
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)