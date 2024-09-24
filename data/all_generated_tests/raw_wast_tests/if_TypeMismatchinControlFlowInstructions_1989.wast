;; 10. **Test Description**:    - Arrange an `if` instruction with a `[i32, f32] -> [i32]` block type, but the `else` branch results in a `f64` type.    - **Constraint Checked**: Enforcing compliance between the output type `i32` and branch output `f64`.    - **Target**: Confirm the correctness of type checking mechanisms within the control flow management.

(assert_invalid
  (module (func $mismatched-output-types (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 42))
      (else (f64.const 3.14))
    )
  ))
  "type mismatch"
)