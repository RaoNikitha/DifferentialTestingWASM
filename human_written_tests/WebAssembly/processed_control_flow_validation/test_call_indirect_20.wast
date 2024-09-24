(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $type-func-num-vs-i32 (call_indirect (type 0) (i32.const 0) (i64.const 1)))
  )
  "type mismatch"
)