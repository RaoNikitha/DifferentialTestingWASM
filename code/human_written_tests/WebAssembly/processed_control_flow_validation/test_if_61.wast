(assert_invalid
  (module (func $type-else-break-last-void-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1)) (else (br 0)))
  ))
  "type mismatch"
)