(assert_invalid
  (module
    (memory 0)
    (func $type-value-empty-vs-num-in-memory.grow (result i32)
      (memory.grow (return))
    )
  )
  "type mismatch"
)