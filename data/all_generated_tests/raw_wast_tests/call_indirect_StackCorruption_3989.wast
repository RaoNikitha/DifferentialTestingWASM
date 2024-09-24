;; 8. **Recursive Function Call**:     Test a recursive function call using `call_indirect` and verify that each call frame is properly managed on the stack. Any mismanagement could lead to stack corruption, hence inspect the stack state after multiple recursive calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $recursive_func)
    (func $recursive_func (param i32) (result i32)
      local.get 0
      if (result i32)
        local.get 0
        i32.const 1
        i32.sub
        call_indirect (type $sig) (i32.const 0)
      else
        i32.const 0
      end
    )
    (func (export "test") (param i32) (result i32)
      local.get 0
      call_indirect (type $sig) (i32.const 0)
    )
  )
  "call_indirect recursive function stack management issue"
)