(assert_invalid
  (module
    (func $type-first-empty-in-block
      (block (call 1))
    )
    (func (param i32))
  )
  "type mismatch"
)