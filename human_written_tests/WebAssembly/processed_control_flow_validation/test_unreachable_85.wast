(assert_invalid
  (module (func $type-br_table-num-vs-num-after-unreachable
    (block (br_table 0 (unreachable) (f32.const 1)))
  ))
  "type mismatch"
)