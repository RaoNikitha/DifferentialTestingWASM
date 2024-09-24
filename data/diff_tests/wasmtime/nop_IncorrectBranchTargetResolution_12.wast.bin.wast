(assert_malformed
  (module
    (type $0 (func (param i32) (result i32)))
    (func $0
      (type 0)
      (block
        (nop)
        (nop)
        (local.get 0)
        (br_if 0)
        (nop)
        (nop)
        (nop)
        (i32.const 1)
      )
      (i32.const 0)
    )
  )
""
)