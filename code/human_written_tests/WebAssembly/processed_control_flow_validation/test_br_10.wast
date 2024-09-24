(assert_invalid
  (module
    (func $type-arg-empty-in-call
      (block (result i32)
        (call 1 (br 0))
      )
      (i32.eqz) (drop)
    )
    (func (param i32) (result i32) (local.get 0))
  )
  "type mismatch"
)