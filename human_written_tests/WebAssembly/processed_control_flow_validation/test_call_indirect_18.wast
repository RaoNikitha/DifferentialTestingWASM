(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $arity-2-vs-0
      (call_indirect (type 0) (f64.const 2) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)