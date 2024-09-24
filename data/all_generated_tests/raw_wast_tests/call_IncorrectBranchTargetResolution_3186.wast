;; 5. **Test via Indirect Function Calls**:    - **Description**: Use `call_indirect` with a function table, inserting invalid indices to test error handling.    - **Constraint**: Verifies that indirect calls resolve to the appropriate function.    - **Relation to Incorrect Branch Target Resolution**: Incorrect resolution could mean the `call_indirect` jumps to a wrong or unspecified address.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (param i32))
    (func $invalid-call-indirect
      (call_indirect (type 0) (i32.const 2) (i32.const 0))
    )
  )
  "out of bounds table access"
)