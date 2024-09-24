(assert_invalid
  (module
    (memory 0)
    (func $type-arg-empty-in-memory.grow
      (block (result i32)
        (memory.grow (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)