(assert_invalid
  (module (func $type-break-nested-f32-vs-void
    (block (result f32) (block (result f32) (br 1 (f32.const 1.0))) (br 0))
  ))
  "type mismatch"
)