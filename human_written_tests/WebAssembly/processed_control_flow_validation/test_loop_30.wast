(assert_invalid
  (module
    (func $type-value-empty-in-then
      (i32.const 0) (i32.const 0)
      (if (then (loop (result i32)) (drop)))
    )
  )
  "type mismatch"
)