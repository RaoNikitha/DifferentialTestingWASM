;; 8. **Test Multiple Nested Labels with Incorrect Condition**:    - **Description**: Situate a `br_if` within multiple nested blocks, looping with incorrect i32 condition checks.    - **Constraint**: Labels must correctly interpret control flow relative to nesting depth.    - **Incorrect Condition Evaluation**: A `br_if` might mistakenly jump due to an improper condition check within deeply nested structures.

(assert_invalid
  (module (func $nested-br-if (block (block (block (block (br_if 2 (i64.const 0))))))))
  "type mismatch"
)