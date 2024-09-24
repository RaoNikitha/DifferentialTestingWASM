;; 2. **Test Description**:    - Use a `call_indirect` instruction to reference a table that contains entries of type `externref` instead of `funcref`.    - **Constraint**: Verifies the strict type checking of the table contents as `funcref`.    - **CFG Relation**: CFG should correctly route to the trap condition when table type is incorrect, ensuring type consistency is maintained.

(assert_invalid
  (module
    (table 1 externref)
    (type (func (param i32)))
    (func $incorrect-table-type (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)