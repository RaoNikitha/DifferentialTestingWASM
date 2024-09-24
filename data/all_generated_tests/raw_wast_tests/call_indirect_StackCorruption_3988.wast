;; 7. **Mismatched Parameter Types**:     Define a function with a specific set of parameter types and create a `call_indirect` instruction where the provided operand types are different. Check if trapping occurs and that no stack corruption is introduced.

(assert_invalid
  (module
    (type (func (param i64) (result i32)))
    (table 1 funcref)
    (func (param i32) (result i32)
      (call_indirect (type 0) (local.get 0))
    )
  )
  "type mismatch"
)