(assert_invalid
  (module
    (func $type-value-empty-in-block
      (i32.const 0)
      (block (loop (result i32)) (drop))
    )
  )
  "type mismatch"
)