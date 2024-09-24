(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-call (result i32)
      (call 1 (return))
    )
    (func (param i32) (result i32) (local.get 0))
  )
  "type mismatch"
)