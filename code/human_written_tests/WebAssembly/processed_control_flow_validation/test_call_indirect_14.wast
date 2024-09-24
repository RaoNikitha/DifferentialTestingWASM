(assert_invalid
  (module
    (type (func (result i64)))
    (table 0 funcref)
    (func $type-num-vs-num (i32.eqz (call_indirect (type 0) (i32.const 0))))
  )
  "type mismatch"
)