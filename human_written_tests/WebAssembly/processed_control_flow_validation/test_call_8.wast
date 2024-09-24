(assert_invalid
  (module
    (func $type-second-void-vs-num (call 1 (i32.const 1) (nop)))
    (func (param i32 i32))
  )
  "type mismatch"
)