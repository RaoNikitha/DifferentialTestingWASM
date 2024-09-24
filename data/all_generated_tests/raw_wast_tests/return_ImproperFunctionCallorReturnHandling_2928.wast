;; 7. Formulate a function where `call_indirect` targets a function whose type does not match the expected results of the enclosing function. Check if the implementation propagates this type inconsistency correctly.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (type $t1 (func (result f64)))
    (table 1 funcref)
    (func $f0 (type $t0) (i32.const 0))
    (func $f1 (type $t1) (f64.const 0))
    (elem (i32.const 0) $f1)
    (func (result i32)
      (call_indirect (type $t0) (i32.const 0))
      (return)
    )
  )
  "type mismatch"
)