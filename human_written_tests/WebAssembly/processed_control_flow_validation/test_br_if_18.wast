(assert_invalid
  (module (func $type-cond-void-vs-i32
    (block (br_if 0 (nop)))
  ))
  "type mismatch"
)