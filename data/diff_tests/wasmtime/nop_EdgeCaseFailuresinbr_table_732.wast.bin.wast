(assert_malformed
  (module
    (type $0 (func))
    (func $0
      (type 0)
      (block (block (block (nop) (br_table 2 1 0 4) (nop)) (nop)) (nop))
    )
  )
""
)