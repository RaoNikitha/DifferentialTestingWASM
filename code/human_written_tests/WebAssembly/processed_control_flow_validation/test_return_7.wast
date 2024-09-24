(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-br_if (result i32)
      (i32.const 0)
      (block (br_if 0 (return) (i32.const 1)))
    )
  )
  "type mismatch"
)