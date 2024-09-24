(assert_invalid
  (module
    (func $f (param i32) (result i32) (local.get 0))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $type-arg-empty-in-call_indirect
      (block (result i32)
        (call_indirect (type $sig)
          (br 0) (i32.const 0)
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)