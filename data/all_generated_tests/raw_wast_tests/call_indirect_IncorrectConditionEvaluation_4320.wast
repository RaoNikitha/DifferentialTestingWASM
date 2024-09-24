;; 9. **Mismatched Return Type**:    - Include functions with a mismatched return type and use `call_indirect` to call them.    - Verify if the OCaml implementation traps correctly by pattern match, while Java may incorrectly handle the signature return type.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 1 funcref)
    (func (result f32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)