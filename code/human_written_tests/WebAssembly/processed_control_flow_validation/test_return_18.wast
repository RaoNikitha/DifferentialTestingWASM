(assert_invalid
  (module
    (memory 1)
    (func $type-value-empty-vs-num-in-store (result i32)
      (i32.store (return) (i32.const 1))
    )
  )
  "type mismatch"
)