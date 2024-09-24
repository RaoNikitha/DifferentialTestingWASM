(assert_malformed
  (module
    (type $0 (func))
    (func $0
      (type 0)
      (block (i32.const 1) (return) (nop) (unreachable))
      (i32.const 45)
    )
  )
""
)