(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-local.set (result i32)
      (local i32)
      (local.set 0 (return)) (local.get 0)
    )
  )
  "type mismatch"
)