(assert_malformed
  (module
    (type $0 (func))
    (func $0
      (type 0)
      (i32.const 1)
      (if
        (result i32)
        (then (i32.const 0))
        (else (if (result i32) (then (i32.const 1)) (else)))
      )
    )
  )
""
)