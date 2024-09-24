(assert_invalid
  (module
    (type $sig (func))
    (func (i32.const 1) (if (type $sig) (i32.const 0) (then)))
  )
  "type mismatch"
)