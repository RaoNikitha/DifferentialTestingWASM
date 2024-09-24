(assert_invalid
  (module
    (func $type-first-num-vs-num (call 1 (f64.const 1) (i32.const 1)))
    (func (param i32 f64))
  )
  "type mismatch"
)