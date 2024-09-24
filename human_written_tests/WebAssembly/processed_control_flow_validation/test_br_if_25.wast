(assert_invalid
  (module
    (func $type-1st-cond-empty-in-return
      (block (result i32)
        (return (br_if 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)