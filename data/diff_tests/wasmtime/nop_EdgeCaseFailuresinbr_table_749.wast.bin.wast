(assert_malformed
  (module (type $0 (func)) (func $0 (type 0) (nop) (block (br_table 0 1))))
""
)