(assert_invalid
  (module
    (func $type-value-empty-in-loop
      (i32.const 0)
      (loop (loop (result i32)) (drop))
    )
  )
  "type mismatch"
)