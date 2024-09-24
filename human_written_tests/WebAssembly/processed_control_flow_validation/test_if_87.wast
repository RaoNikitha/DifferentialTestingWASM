(assert_invalid
  (module
    (func $type-condition-empty-in-select
      (select (if(then)) (i32.const 1) (i32.const 2)) (drop)
    )
  )
  "type mismatch"
)