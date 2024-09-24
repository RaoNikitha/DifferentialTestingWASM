(assert_malformed
  (module
    (type $0 (func))
    (func $0
      (type 0)
      (block
        (br_table 0 1 2 3)
        (nop)
        (nop)
        (nop)
        (nop)
        (nop)
        (nop)
        (nop)
        (nop)
        (nop)
        (nop)
        (br_table 0 1 2)
      )
    )
  )
""
)