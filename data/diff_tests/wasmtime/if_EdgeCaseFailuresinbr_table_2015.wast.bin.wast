(assert_malformed
  (module
    (type $0 (func))
    (func $0 (type 0) (i32.const 1) (if (then (br_table 4_294_967_295)) (else)))
  )
""
)