;; 3. **Test Description**:    - Structure an `if` block with a `[f64] -> [i32]` type, but ensure that the `then` branch outputs an `f64` value.    - **Constraint Checked**: Mismatch of output stack types where `then` branch outputs `f64` instead of `i32`.    - **Target**: Examine if the engine accurately detects and handles violations in the result type of `then` branch.

(assert_invalid
  (module (func $type-mismatch-then-branch (result i32)
    (if (result i32) (i32.const 1)
      (then (f64.const 1.0))
    )
  ))
  "type mismatch"
)