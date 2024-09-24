;; 8. Implement a `call_indirect` operation where the table contains a mixture of valid and invalid function references. The test checks if OCaml traps during pattern match failure while Java has potential issues in validating and invoking `checkSignature` method.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64) (result i64)))
    (table funcref (elem 0 1 1 2))
    (func $func1 (param i32) (result i32)
      (local.get 0)
    )
    (func $func2 (param f64) (result i64)
      (f64.const 0)
    )
    (func (call_indirect (type 0) (i32.const 0) (i32.const 1)))
    (func (call_indirect (type 1) (i32.const 2) (i32.const 3)))
  )
  "type mismatch"
)