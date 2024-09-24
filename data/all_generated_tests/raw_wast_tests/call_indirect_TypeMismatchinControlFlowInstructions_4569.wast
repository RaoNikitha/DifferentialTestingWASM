;; 8. **Function Table Indexing with Mixed Signature Types:**    - Ensure that `call_indirect` correctly handles table entries with varying function types, validating that mismatched type indices induce traps. Focus on verifying the differential error handling between OCaml and Java.

(assert_invalid
  (module
    (type $sig1 (func (param i32))) 
    (type $sig2 (func (param i64)))
    (func $f1 (param i32))
    (table funcref (elem $f1))
    (func (call_indirect (type $sig2) (i32.const 0)))
  )
  "type mismatch"
)