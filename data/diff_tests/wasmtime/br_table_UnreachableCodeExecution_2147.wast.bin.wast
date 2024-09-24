(assert_malformed
  (module
    (type $0 (func (result i32)))
    (func $0 (type 0) (block (i32.const 2) (br_table 0 1)) (i32.const 1))
  )
""
)