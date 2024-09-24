;; 2. **Table with Non-Funcref Type**:    Define a table that does not contain `funcref` references and execute a `call_indirect` instruction. This will check if the type conformity is properly enforced. In `br_table`, similar validation for the type of indices is necessary to avoid errors.

(assert_invalid
  (module
    (table 0 externref)
    (type (func (param i32) (result i32)))
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "expected funcref but found externref"
)