;; 7. **Test Description**:    Execute `call_indirect` with a valid index that points to a function returning more values than the calling context expects. Test its handling of extra return values on the operand stack.

(assert_invalid
  (module
    (type $sig_caller (func (param i32) (result i32)))
    (type $sig_callee (func (param i32) (result i32 i32)))
    (func $callee (type $sig_callee) (param i32) (result i32 i32)
      (i32.const 42) (i32.const 43)
    )
    (table 1 funcref)
    (elem (i32.const 0) $callee)
    (func $caller
      (call_indirect (type $sig_caller) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)