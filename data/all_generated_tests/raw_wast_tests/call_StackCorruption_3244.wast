;; 3. **Test Description**: Call a function with mismatched argument types.    - **Constraint**: Verifies type validation and argument transfer correctness.    - **Relation to Stack Corruption**: Ensures mismatched types do not corrupt the stack by pushing incorrectly typed values.

(assert_invalid
  (module
    (func $mismatched-arg-types (call 1 (i32.const 0) (f32.const 1.0)))
    (func (param i32 i32))
  )
  "type mismatch"
)