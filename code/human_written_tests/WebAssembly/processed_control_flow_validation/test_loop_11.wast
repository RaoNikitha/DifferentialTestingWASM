(assert_malformed
  (module quote
    "(type $sig (func (param i32 i32) (result i32)))"
    "(func (i32.const 0) (loop (type $sig) (param i32) (result i32)) (unreachable))"
  )
  "inline function type"
)