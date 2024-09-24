;; 6. **Test Function Table Mismatch**:    - **Description**: Use a `call_indirect` instruction with a type index that doesn't match the function signature in the function table.    - **Constraint**: Ensure that the function signature matches the type index in the function table exactly.    - **Relation to CFG**: Misaligned CFG handling could interpret indirect calls incorrectly, leading to improper function execution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $mismatch (type 1) (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)