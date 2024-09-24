(assert_invalid
  (module
    (global $x (mut i32) (i32.const 0))
    (func $type-value-empty-vs-num-in-global.set (result i32)
      (global.set $x (return)) (global.get $x)
    )
  )
  "type mismatch"
)