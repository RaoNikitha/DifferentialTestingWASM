(assert_invalid
  (module
    (func $type-second-empty-in-loop
      (loop (call 1 (i32.const 0)))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)