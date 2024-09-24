;; 4. **Type Enforcement in Conditional Branches**:    - **Description**: Use a `br_if` to conditionally branch to an `if` instruction that needs an `i64` value, but `br_if` provides an `i32`.    - **Constraint**: Ensures conditional branches respect type requirements of target constructs.    - **Differential Behavior**: WASM should fail on type mismatch, while wizard_engine might incorrectly handle the control transfer.

(assert_invalid
  (module (func $type-cond-i32-vs-i64
    (block (i64.const 0) (br_if 0 (i32.const 1)))
  ))
  "type mismatch"
)