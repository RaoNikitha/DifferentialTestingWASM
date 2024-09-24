;; 5. **Nested Block with Erroneous Function Call**:     - Use nested blocks where the inner block calls an incorrect function type via `call_indirect`.     - **Constraint**: Nested block result types must fit the expected signature.     - **Test Relation**: Verifies that error propagation works correctly in deeply nested control flows.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (call_indirect (type 1) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)