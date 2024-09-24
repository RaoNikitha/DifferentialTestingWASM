;; 5. **Mismatched Input Types to Condition**:    - Use a non-`i32` type (e.g., `f32`) on the stack as the condition for the `if` instruction.    - This checks if the condition being evaluated by the `if` is strictly validated as `i32`.    - **Constraint**: The top of the operand stack must strictly be `i32` for `if` condition evaluation.

(assert_invalid
  (module
    (func $type-condition-non-i32
      (f32.const 1.0)
      (if (result i32) (then (i32.const 0)) (else (i32.const 1)))
    )
  )
  "type mismatch"
)