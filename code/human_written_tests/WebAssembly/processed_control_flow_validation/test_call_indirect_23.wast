(assert_invalid
  (module
    (type (func (param i32 f64)))
    (table 0 funcref)
    (func $type-first-num-vs-num
      (call_indirect (type 0) (f64.const 1) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)