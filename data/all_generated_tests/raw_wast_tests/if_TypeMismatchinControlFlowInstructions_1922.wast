;; 3. **Invalid Type Push in Else Block**:    - Have the `else` block use an instruction that pushes an `i64` onto the stack while expecting `i32`.    - It checks if the implementation correctly validates the type pushed by the `else` branch.    - **Constraint**: The operand stack types at block exit must match the declared block type.

(assert_invalid
  (module (func $invalid-type-push-in-else (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (i64.const 1))
    )
  ))
  "type mismatch"
)