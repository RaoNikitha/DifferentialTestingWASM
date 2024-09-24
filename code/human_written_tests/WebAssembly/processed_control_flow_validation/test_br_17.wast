(assert_invalid
  (module
    (memory 1)
    (func $type-arg-empty-in-store
      (block (result i32)
        (i32.store (br 0) (i32.const 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)