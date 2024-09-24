(assert_invalid
  (module
    (func $type-arg-value-empty-in-then
      (block
        (i32.const 0) (i32.const 0)
        (if (result i32) (then (br_table 0 (i32.const 1))))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)