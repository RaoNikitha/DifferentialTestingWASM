;; 1. **Mismatched Function Type and Table Index Test**:    - **Description**: Create a test where the `call_indirect` instruction indexes into a table with a function type that does not match the expected type. Verify that traps are correctly triggered due to the type mismatch.    - **Constraint**: Checks that the type dynamically resolved at runtime matches the expected function type (`typeidx`) and fails properly if it does not.    - **CFG Relation**: Ensures that execution correctly branches into the trap condition, demonstrating consistency in CFG handling for type mismatches.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32) (result f64)))
    (func (param i32) (result f64)
      f64.const 1.0
    )
    (table funcref (elem 0))
    (func
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)