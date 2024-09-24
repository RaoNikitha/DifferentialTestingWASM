;; 4. **Test 4 - Function Return Type Mismatch**:    - Description: Design a function that must return an integer via the return instruction but instead generate a floating-point value within the function body.    - Constraint: Checks if the `return` instruction enforces the function's declared return type during execution.

(assert_invalid
  (module
    (func $type-func-return-mismatch (result i32)
      (f32.const 1.0)
      (return)
    )
  )
  "type mismatch"
)