;; 9. **Test Description**:    A `call_indirect` pointing to a function that itself contains another `call_indirect`, resulting in nested indirect calls. This tests cascading traps and stack consistency across multiple function layers.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $callee)
    (func $callee (param i32) (call_indirect (type 1) (i32.const 0)))
    (func (param i32) (result i32)
      (call_indirect (type 0) (i32.const 0) (local.get 0))
    )
  )
  "type mismatch"
)