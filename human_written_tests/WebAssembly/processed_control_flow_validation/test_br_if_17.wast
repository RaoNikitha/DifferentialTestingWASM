(assert_invalid
  (module (func $type-cond-empty-vs-i32
    (block (br_if 0))
  ))
  "type mismatch"
)