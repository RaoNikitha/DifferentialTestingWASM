;; 5. **Test Description**:    Use a `call_indirect` that resolves to a function requiring multiple parameters but only provide one. This ensures that the engine traps correctly and doesn't consume unrelated stack items.

(assert_invalid
  (module
    (type $sig (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32 i32) (result i32)
      local.get 0
    )
    (func (result i32)
      i32.const 0
      call_indirect (type $sig)
    )
  )
  "type mismatch: expected 1 but got $func"
)