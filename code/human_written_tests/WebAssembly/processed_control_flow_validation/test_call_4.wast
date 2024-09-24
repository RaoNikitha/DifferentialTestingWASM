(assert_invalid
  (module
    (func $arity-0-vs-2 (call 1))
    (func (param f64 i32))
  )
  "type mismatch"
)