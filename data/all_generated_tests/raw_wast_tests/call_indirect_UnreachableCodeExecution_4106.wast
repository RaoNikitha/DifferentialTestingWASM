;; 5. **Test Description**:    Define a table with `funcref` but attempt to `call_indirect` with a `typeidx` that references a non-existent function type. Append an `unreachable` instruction to the end of the function performing the `call_indirect`.    - **Constraint Checked**: Type index referencing.    - **Relation to Unreachable Code Execution**: The non-existent function type reference should cause a trap, preventing execution of the `unreachable` instruction.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func (result i32)
      (call_indirect (type 1) (i32.const 0))
      unreachable
    )
  )
  "unknown type"
)