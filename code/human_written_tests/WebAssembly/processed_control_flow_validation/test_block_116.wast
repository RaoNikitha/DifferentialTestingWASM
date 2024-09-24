(assert_invalid
  (module (func $type-break-nested-empty-vs-f64 (result f64)
    (block (result f64) (block (br 1)) (br 0 (f64.const 1)))
  ))
  "type mismatch"
)