(assert_malformed
  (module
    (type $0 (func))
    (func $0 (type 0) (block (i32.const 1) (br_table 268_435_457 0)))
  )
""
)