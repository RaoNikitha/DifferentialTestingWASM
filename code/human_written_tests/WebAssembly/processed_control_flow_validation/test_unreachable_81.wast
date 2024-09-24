(assert_invalid
  (module (func $type-br_if-cond-num-vs-num-after-unreachable
    (block (br_if 0 (unreachable) (f32.const 0)))
  ))
  "type mismatch"
)