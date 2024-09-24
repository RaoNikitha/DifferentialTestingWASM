;; 7. **Invalid Type Reference**:    - Test a `call_indirect` instruction using an invalid function type reference, ensuring a trap due to missing or malformed type indices.    - This verifies that type references are valide and checked against the context definitions.    - It relates to `br_table` by ensuring type validation is applied to indirect branches and function calls alike.

(assert_invalid
  (module
    (table funcref)
    (func $invalid-type-ref (call_indirect (type 100) (i32.const 0)))
  )
  "unknown type"
)