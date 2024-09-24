(assert_invalid
  (module
    (func $type-arg-empty-in-return
      (block (result i32)
        (return (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)