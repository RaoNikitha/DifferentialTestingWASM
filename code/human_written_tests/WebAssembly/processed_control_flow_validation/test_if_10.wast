(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (i32.const 1)"
    "  (if (type $sig) (param i32) (then (drop)) (else (drop)))"
    "  (unreachable)"
    ")"
  )
  "inline function type"
)