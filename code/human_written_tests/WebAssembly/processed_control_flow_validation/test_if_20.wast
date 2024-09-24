(assert_invalid
  (module (func $type-empty-f64 (result f64) (if (i32.const 0) (then) (else))))
  "type mismatch"
)