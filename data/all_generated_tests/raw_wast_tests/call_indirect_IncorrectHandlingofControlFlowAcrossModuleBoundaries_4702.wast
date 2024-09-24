;; 1. Test importing a function from another module that throws an exception if an incorrect parameter type is passed. The `call_indirect` should trap properly if there's a type mismatch between the imported function's signature and what the call expects.

(assert_invalid
  (module
    (import "env" "external_func" (func $extern_func (param i64) (result i32)))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $extern_func))
    (func
      (call_indirect (type $sig) (i32.const 42) (i32.const 0))
    )
  )
  "type mismatch"
)