;; 4. **Complex Condition Evaluation**:    - Compose a block with a complex condition involving multiple instructions (e.g., `i32.const 3`, `i32.const 1`, `i32.add`, `i32.const 4`, `i32.eq`, `br_if 0`). Test if the combined evaluation is performed correctly.        Constraints: Ensures that the stacked operand results are chosen precisely for condition evaluation.

(assert_invalid
  (module (func $complex-condition-evaluation
    (block (result i32)
      i32.const 3
      i32.const 1
      i32.add
      i32.const 4
      i32.eq
      br_if 0
      i32.const 42
    )
  ))
  "type mismatch"
)