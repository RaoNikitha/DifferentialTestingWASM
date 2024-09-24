;; 6. **Test Description**:    Define a `call_indirect` with `typeidx` that expects no parameters but provide multiple operands on the stack before the call. Check if it correctly traps and leaves the stack uncorrupted.

(assert_invalid
  (module
    (type (func))
    (table funcref (elem $f))
    (func $f (result i32) (i32.const 42))
    (func (result i32)
      (i32.const 0) (i32.const 0)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)