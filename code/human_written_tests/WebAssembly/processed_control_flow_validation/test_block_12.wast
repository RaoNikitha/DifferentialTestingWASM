(assert_invalid
  (module
    (type $sig (func))
    (func (block (type $sig) (i32.const 0)))
  )
  "type mismatch"
)