(assert_invalid
  (module
    (func $type-arg-empty-in-select
      (block (result i32)
        (select (br 0) (i32.const 1) (i32.const 2))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)