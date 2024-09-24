(assert_invalid
  (module
    (memory 1)
    (func $type-condition-empty-in-store
      (i32.store (if(then)) (i32.const 1))
    )
  )
  "type mismatch"
)