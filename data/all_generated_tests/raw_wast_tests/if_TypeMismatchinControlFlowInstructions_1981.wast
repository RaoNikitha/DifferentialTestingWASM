;; 2. **Test Description**:    - Create an `if` block with `[i32] -> []` type, followed by an `else` block that pushes an `i64` value instead of no values to the stack.    - **Constraint Checked**: Discrepancy between expected outputs (no values) and provided outputs (`i64`) in `else` branch.    - **Target**: Check enforcement of result type consistency in control flow blocks.

(assert_invalid
  (module (func $type-else-type-mismatch (result i32)
    (i32.const 0)
    (if (result i32) (then (i32.const 1)) (else (i64.const 1)))
  ))
  "type mismatch"
)