;; 6. **Invalid Type Index**: Use a `typeidx` that does not exist in the module and ensure `call_indirect` appropriately traps or fails.    - **Constraint**: Non-existent type index.    - **CFG Relation**: Confirms proper trap execution within the CFG when encountering undefined type references.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func $invalid-type-idx (call_indirect (type 1) (i32.const 0)))
  )
  "unknown type"
)