(assert_invalid
  (module
    (func $type-condition-empty-in-then
      (i32.const 0) (i32.const 0)
      (if (then (if (then))))
    )
  )
  "type mismatch"
)