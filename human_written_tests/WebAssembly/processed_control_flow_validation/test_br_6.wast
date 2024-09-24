(assert_invalid
  (module
    (func $type-arg-empty-in-br_if
      (i32.const 0)
      (block (result i32) (br_if 0 (br 0) (i32.const 1))) (i32.eqz) (drop)
    )
  )
  "type mismatch"
)