(assert_invalid
  (module
    (func $arity-0-vs-1 (call 1))
    (func (param i32))
  )
  "type mismatch"
)