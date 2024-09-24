(assert_invalid
  (module
    (memory 1)
    (func $type-arg-empty-in-load
      (block (result i32)
        (i32.load (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)