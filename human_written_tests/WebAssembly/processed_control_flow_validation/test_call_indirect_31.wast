(assert_invalid
  (module
    (table 0 funcref)
    (func $unbound-type (call_indirect (type 1) (i32.const 0)))
  )
  "unknown type"
)