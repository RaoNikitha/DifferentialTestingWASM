(assert_invalid
  (module (func $type-value-num-vs-num (result f64) (return (i64.const 1))))
  "type mismatch"
)