(assert_malformed
  (module quote
    "(type $sig (func (param i32 i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (type $sig) (param i32) (result i32)"
    "    (i32.const 0) (i32.const 0)"
    "  )"
    ")"
  )
  "inline function type"
)