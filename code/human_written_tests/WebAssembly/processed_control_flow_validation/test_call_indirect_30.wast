(assert_invalid
  (module
    (func $f (param i32 i32))
    (type $sig (func (param i32 i32)))
    (table funcref (elem $f))
    (func $type-second-empty-in-then
      (i32.const 0) (i32.const 0)
      (if
        (then
          (call_indirect (type $sig) (i32.const 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)