;; 9. **Polymorphic Function Type Handling**:    - Implement a polymorphic function with multiple valid call signatures and attempt to call it indirectly. Different handling strategies in signature checks between the two implementations could lead to varied stack compositions post-call.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 f32) (result f32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $polymorphic (type 1) (param i32 f32) (result f32)
      (local.get 1))
    (func $poly-call
      (call_indirect (type 0) (i32.const 0) (i32.const 10) (f32.const 3.14))
    )
  )
  "type mismatch"
)