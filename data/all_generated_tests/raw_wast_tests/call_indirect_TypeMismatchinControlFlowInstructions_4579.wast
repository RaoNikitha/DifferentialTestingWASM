;; 8. **Function Call Inside Try-Catch Block**:     - Execute `call_indirect` within a `try` block where the function type is incorrect, and ensure it raises an exception caught by a `catch`.     - **Constraint**: Exception handling must be correctly triggered on type mismatch.     - **Test Relation**: Ensures differential handling of traps within exception handling constructs.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i64)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (type 0)
      (try (do
        (call_indirect (type 1) (i32.const 0))
        )
        (catch_all)
      )
    )
  )
  "type mismatch"
)