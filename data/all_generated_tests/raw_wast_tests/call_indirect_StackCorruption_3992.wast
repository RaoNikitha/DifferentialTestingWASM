;; 1. **Mismatched Return Type Handling**:    - Test a `call_indirect` with a function in the table that has a mismatched return type compared to the expected type. This should trigger a return type mismatch. While OCaml might pattern match and immediately trap, Java's helper method may lead to improper stack cleanup.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $f (result f32) (f32.const 0))
    (table funcref (elem $f))
    (func $mismatched-return-type
      (i32.const 0)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)