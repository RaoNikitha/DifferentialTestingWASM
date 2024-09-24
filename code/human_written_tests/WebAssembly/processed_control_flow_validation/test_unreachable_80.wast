(assert_invalid
  (module (func $type-br-second-num-vs-num (result i32)
    (block (result i32) (br 0 (i32.const 1)) (br 0 (f64.const 1)))
  ))
  "type mismatch"
)