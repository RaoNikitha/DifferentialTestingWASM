(assert_invalid
  (module
    (func $type-condition-empty-in-loop
      (i32.const 0)
      (loop (if (then)))
    )
  )
  "type mismatch"
)