(assert_invalid
  (module
    (type $sig (func))
    (func (loop (type $sig) (i32.const 0)))
  )
  "type mismatch"
)