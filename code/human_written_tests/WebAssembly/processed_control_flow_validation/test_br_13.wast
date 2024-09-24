(assert_invalid
  (module
    (func $type-arg-empty-in-local.tee
      (local i32)
      (block (result i32)
        (local.tee 0 (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)