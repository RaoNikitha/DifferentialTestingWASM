(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-return (result i32)
      (return (return))
    )
  )
  "type mismatch"
)