(assert_invalid
  (module (func $type-false-arg-num-vs-void
    (block (br_if 0 (i32.const 0) (i32.const 0)))
  ))
  "type mismatch"
)