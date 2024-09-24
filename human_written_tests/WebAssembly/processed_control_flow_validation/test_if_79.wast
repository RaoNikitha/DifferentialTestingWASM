(assert_invalid
  (module
    (func $type-condition-empty-in-block
      (i32.const 0)
      (block (if (then)))
    )
  )
  "type mismatch"
)