;; 2. Utilize a `call_indirect` that references a table missing the specific function type but containing a similar function with a branch targeting a non-existent section. This tests the Java implementation’s handling conditions when it resolves branch labels incorrectly for function types.

(assert_invalid
  (module
    (type $sig_empty (func))
    (type $sig_non_empty (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
       (br 2)
    )
    (func
      (call_indirect (type $sig_empty) (i32.const 0))
    )
  )
  "type mismatch"
)