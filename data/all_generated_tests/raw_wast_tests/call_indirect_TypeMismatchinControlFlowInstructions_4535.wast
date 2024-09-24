;; 4. **Nested Indirect Calls with Type Mismatch in Inner Block**:    - Description: Implement nested `block` instructions where the inner `block` expects an `i64` return type, but calls a function indirectly that returns an `f32`. The type mismatch should cause a runtime error when the inner block exits.

(assert_invalid
  (module
    (type $t0 (func (result i64)))
    (type $t1 (func (result f32)))
    (table funcref (elem $f))
    (func $f (result f32) (f32.const 0.0))
    (func $nested-blocks
      (block (result i64)
        (call_indirect (type $t0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)