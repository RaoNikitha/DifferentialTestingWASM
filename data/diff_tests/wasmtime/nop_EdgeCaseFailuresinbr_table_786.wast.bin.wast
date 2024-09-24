(assert_malformed
  (module (type $0 (func)) (func $0 (type 0) (block (nop) (br_table 0 0 2))))
""
)