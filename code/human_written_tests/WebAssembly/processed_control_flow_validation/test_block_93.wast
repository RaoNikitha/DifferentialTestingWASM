(assert_invalid
  (module (func $type-break-first-void-vs-f64 (result f64)
    (block (result f64) (br 0 (nop)) (br 0 (f64.const 1.0)))
  ))
  "type mismatch"
)