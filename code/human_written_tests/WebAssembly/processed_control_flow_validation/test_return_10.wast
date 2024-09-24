(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-select (result i32)
      (select (return) (i32.const 1) (i32.const 2))
    )
  )
  "type mismatch"
)