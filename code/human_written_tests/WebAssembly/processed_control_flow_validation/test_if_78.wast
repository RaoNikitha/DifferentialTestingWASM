(assert_invalid
  (module
    (func $type-condition-empty
      (if (then))
    )
  )
  "type mismatch"
)