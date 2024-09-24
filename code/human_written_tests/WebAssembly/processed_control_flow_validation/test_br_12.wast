(assert_invalid
  (module
    (func $type-arg-empty-in-local.set
      (local i32)
      (block (result i32)
        (local.set 0 (br 0)) (local.get 0)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)