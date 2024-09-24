(assert_invalid
  (module
    (func $type-first-empty-in-then
      (if (i32.const 0) (then (call 1)))
    )
    (func (param i32))
  )
  "type mismatch"
)