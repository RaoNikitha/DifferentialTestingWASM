(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $type-first-empty-in-block
      (block
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)