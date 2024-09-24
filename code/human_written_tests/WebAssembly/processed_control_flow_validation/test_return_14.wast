(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-local.tee (result i32)
      (local i32)
      (local.tee 0 (return))
    )
  )
  "type mismatch"
)