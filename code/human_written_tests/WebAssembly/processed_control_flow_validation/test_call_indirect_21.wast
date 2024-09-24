(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 0 funcref)
    (func $type-first-void-vs-num
      (call_indirect (type 0) (nop) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)