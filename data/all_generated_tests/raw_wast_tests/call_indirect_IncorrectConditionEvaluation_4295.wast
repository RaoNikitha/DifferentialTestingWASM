;; 4. Check `call_indirect` behavior when the function type signature in the table is polymorphic and doesn’t exactly match the signature defined in `typeidx`, ensuring strict type conformity constraints are followed.

(assert_invalid
  (module
    (type (func (param f64) (result i32)))
    (type (func (param f64)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (type 1) (param f64))
    (func $test (param f64) (call_indirect (type 0) (i32.const 0) (local.get 0)))
  )
  "type mismatch"
)