(assert_malformed
  (module
    (type $0 (func (result i32)))
    (func $0
      (type 0)
      (i32.const 5)
      (loop (result i32) (nop) (i32.const 1) (br_if 0) (unreachable))
    )
  )
""
)