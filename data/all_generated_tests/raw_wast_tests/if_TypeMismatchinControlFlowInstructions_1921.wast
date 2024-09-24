;; 2. **Type Mismatch Between Branches**:    - Create an `if` instruction where the `then` block outputs `f32` and the `else` block outputs `i32`.    - This will verify that both branches of conditional blocks have consistent output types.    - **Constraint**: Matching result types of `then` and `else` branches to the block type.

(assert_invalid
  (module (func $type-mismatch-between-branches (result i32)
    (if (result i32) (i32.const 1) (then (f32.const 0.0)) (else (i32.const 0)))
  ))
  "type mismatch"
)