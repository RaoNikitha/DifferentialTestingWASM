;; 8. **Test Description 8**:    - Create a scenario where `call_indirect` in a `loop` continually evaluates the type index against a non-existent function type. Improper type context verification results in an infinite checking loop.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func
      (loop (call_indirect (type 1) (i32.const 0)))
    )
  )
  "type mismatch"
)