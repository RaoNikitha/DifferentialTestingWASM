;; 4. **Test `if` Instruction with Floating-Point Precision**:    - Description: Implement `if` instructions comparing operands converted from floating-point to `i32` and ensure correct branching logic based on precision.    - Constraint: Verifies that `i32` conversion from floating-point values accurately affects condition evaluation.    - Incorrect Condition Evaluation: Check if Wizard Engine misinterprets converted floating-point values leading to branching errors.

(assert_invalid
  (module (func $test_floating_point_if
    (if (i32.eqz (f32.convert_i32_s (f32.const 0.0))) (then (i32.const 1)) (else (i32.const 0)))
  ))
  "type mismatch"
)