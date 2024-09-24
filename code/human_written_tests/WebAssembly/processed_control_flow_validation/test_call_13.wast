(assert_invalid
  (module
    (func $type-first-empty-in-loop
      (loop (call 1))
    )
    (func (param i32))
  )
  "type mismatch"
)