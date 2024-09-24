(assert_invalid
  (module
    (global $x (mut i32) (i32.const 0))
    (func $type-arg-empty-in-global.set
      (block (result i32)
        (global.set $x (br 0)) (global.get $x)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)