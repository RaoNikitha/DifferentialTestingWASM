(assert_invalid
  (module
    (func $type-second-empty-in-then
      (if (i32.const 0) (then (call 1 (i32.const 0))))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)