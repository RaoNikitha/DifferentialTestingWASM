;; 9. **Immediate Value Handling**:    Test `call_indirect` with varying immediate values for `typeidx` and `tableidx` to confirm the correct interpretation and context checking of immediates by both implementations, ensuring robustness.      **Constraint**: Ensure immediate values are correctly interpreted and checked.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64) (result f64)))
    (table 1 funcref)
    (func $type-mismatch (i32.eqz (call_indirect (type 1) (i32.const 0))))
  )
  "type mismatch"
)