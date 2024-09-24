(assert_invalid
  (module
    (func $type-condition-empty-in-br_if
      (i32.const 0)
      (block (br_if 0 (if(then)) (i32.const 1)) (drop))
    )
  )
  "type mismatch"
)