(assert_invalid
  (module
    (func $type-condition-empty-in-call
      (call 1 (if(then))) (drop)
    )
    (func (param i32) (result i32) (local.get 0))
  )
  "type mismatch"
)