;; 5. **Test Description:**    - **Scenario:** Execute `unreachable` after pushing multiple mixed data types to the stack without consuming them.    - **Specific Constraint Checked:** Verifies that the trap occurs without checking the types or altering the stack.    - **Relation to Stack Corruption:** Ensures stack remains untouched by type mismatches beyond `unreachable`.

(assert_invalid
  (module (func $type-mixed-stack-before-unreachable
    (block (i32.const 1) (f32.const 1.0) (i64.const 1) (f64.const 1.0) (unreachable))
  ))
  "type mismatch"
)