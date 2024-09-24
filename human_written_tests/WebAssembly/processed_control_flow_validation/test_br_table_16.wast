(assert_invalid
  (module
    (func $type-arg-value-empty-in-return
      (block (result i32)
        (return (br_table 0 (i32.const 1)))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)