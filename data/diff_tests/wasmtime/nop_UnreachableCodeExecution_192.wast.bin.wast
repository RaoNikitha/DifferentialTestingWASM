(assert_malformed
  (module
    (type $0 (func (result i32)))
    (func $0
      (type 0)
      (i32.const 0)
      (if (then (nop)) (else (nop) (unreachable)))
    )
  )
""
)