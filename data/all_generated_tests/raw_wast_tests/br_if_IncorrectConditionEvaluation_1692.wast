;; 3. **Test Invalid Condition Type**:    - **Description**: Place a non-i32 type value at the top of the stack before executing a `br_if`.    - **Constraint**: The condition must be of type i32.    - **Incorrect Condition Evaluation**: The `br_if` evaluates a non-i32 type, causing an invalid branch operation.

(assert_invalid
  (module (func $invalid-condition-type
    (block (br_if 0 (i64.const 0)))
  ))
  "type mismatch"
)