(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-br (result i32)
      (i32.const 0)
      (block (br 0 (return)))
    )
  )
  "type mismatch"
)