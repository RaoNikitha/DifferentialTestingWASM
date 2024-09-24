(assert_invalid
  (module
    (func $type-arg-index-empty-in-return
      (block (result i32)
        (return (br_table 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)