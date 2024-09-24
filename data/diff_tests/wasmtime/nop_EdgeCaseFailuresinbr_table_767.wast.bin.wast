(assert_malformed
  (module (type $0 (func)) (func $0 (type 0) (block (nop) (nop) (br_table 0))))
""
)