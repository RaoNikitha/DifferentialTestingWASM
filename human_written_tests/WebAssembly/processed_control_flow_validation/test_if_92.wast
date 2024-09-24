(assert_invalid
  (module
    (global $x (mut i32) (i32.const 0))
    (func $type-condition-empty-in-global.set
      (global.set $x (if(then))) (global.get $x) (drop)
    )
  )
  "type mismatch"
)