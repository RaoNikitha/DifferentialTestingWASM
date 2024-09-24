(assert_invalid
  (module (func $type-break-operand-void-vs-f64 (result f64)
    (f64.floor (block (br 0 (nop))))
  ))
  "type mismatch"
)