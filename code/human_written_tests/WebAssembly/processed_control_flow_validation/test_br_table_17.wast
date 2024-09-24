(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 1) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)