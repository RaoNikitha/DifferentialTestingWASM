;; 7. **Invalid Type Index**:    Create a test where the `typeidx` in `call_indirect` references a non-existing type in the types section. This determines if the type index validation is correctly enforced. Similarly, `br_table` must validate index types to ensure proper function resolution.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $invalid-type-index
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type index out of bounds"
)