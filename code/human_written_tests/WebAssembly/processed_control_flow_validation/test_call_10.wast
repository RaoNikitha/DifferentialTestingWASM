(assert_invalid
  (module
    (func $type-second-num-vs-num (call 1 (i32.const 1) (f64.const 1)))
    (func (param f64 i32))
  )
  "type mismatch"
)