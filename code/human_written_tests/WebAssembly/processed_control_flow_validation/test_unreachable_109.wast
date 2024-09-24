(assert_invalid
  (module (func $br_if-unreachable (result i32)
    (block (result i32)
      (block
        (br_if 1 (unreachable) (i32.const 0))
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)