(assert_invalid
  (module
    (func $type-arg-empty-in-br
      (i32.const 0)
      (block (result i32) (br 0 (br 0))) (i32.eqz) (drop)
    )
  )
  "type mismatch"
)