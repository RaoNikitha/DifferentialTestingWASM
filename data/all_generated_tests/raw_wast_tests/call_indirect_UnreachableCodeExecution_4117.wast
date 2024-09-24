;; 6. **Invalid Table Reference**:    Utilize a non-existent table index in the `call_indirect` instruction. Execute the module to trap and reach an `unreachable` instruction, thus testing the integrity of table reference validation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 0 funcref)
    (func $invalid-table-ref
      (call_indirect (type 0) (i32.const 1) (i32.const 0))
    )
  )
  "table index out of bounds"
)