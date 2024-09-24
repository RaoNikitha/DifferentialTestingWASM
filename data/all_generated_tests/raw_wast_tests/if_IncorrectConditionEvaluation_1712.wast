;; 3. **Test Description**:    - **Test Name**: ConstantFalseCondition    - **Test Goal**: Check if an `if` with a constant false (`0`) condition bypasses the `then` block correctly.    - **Specific Constraint**: The block should jump directly to `else` or `end`.    - **Relation to Incorrect Condition Evaluation**: Determines if the `if` condition misinterprets false as true.

(assert_invalid
  (module (func $ConstantFalseCondition
    (i32.const 0)
    (if (then (i32.const 1)) (else (i32.const 2)) (end))
  ))
  "type mismatch"
)