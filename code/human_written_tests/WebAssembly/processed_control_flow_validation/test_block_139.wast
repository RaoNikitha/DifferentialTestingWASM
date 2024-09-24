(assert_invalid
  (module (func $type-break-operand-empty-vs-f64 (result f64)
    (f64.floor (block (br 0)))
  ))
  "type mismatch"
)