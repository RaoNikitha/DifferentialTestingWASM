(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (loop (type $sig) (result i32) (i32.const 0)) (unreachable))"
  )
  "inline function type"
)