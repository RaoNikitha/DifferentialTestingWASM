(assert_invalid
  (module
    (func $f (param i32) (result i32) (local.get 0))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $type-condition-empty-in-call_indirect
      (block (result i32)
        (call_indirect (type $sig)
          (if(then)) (i32.const 0)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)