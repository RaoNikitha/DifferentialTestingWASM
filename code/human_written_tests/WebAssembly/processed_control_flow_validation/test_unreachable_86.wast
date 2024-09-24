(assert_invalid
  (module (func $type-br_table-label-num-vs-num-after-unreachable (result i32)
    (block (result i32) (unreachable) (br_table 0 (f32.const 0) (i32.const 1)))
  ))
  "type mismatch"
)