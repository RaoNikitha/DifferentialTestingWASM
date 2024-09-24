(assert_invalid
  (module
    (memory 0)
    (func $type-value-empty-vs-num-in-load (result i32)
      (i32.load (return))
    )
  )
  "type mismatch"
)