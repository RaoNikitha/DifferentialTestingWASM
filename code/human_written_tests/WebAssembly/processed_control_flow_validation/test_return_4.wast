(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-then (result i32)
      (i32.const 0) (i32.const 0)
      (if (then (return)))
    )
  )
  "type mismatch"
)