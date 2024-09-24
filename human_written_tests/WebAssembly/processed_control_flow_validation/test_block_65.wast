(assert_invalid
  (module (func $type-break-last-void-vs-f64 (result f64)
    (block (result f64) (br 0))
  ))
  "type mismatch"
)