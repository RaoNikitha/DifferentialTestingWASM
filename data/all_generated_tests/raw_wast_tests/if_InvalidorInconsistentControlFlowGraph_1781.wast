;; 2. **Test: Mismatched Block Type in Nested `if`**    - **Description**: Design a nested `if` structure where the inner `if` does not match the block type of the outer `if`, leading to a type mismatch.    - **Constraint Checked**: Ensures nested blocks maintain proper type consistency.    - **CFG Relevance**: Examines how the CFG deals with type mismatches in nested control flow structures.

(assert_invalid
  (module (func $nested-mismatch (result i32)
    (if (result i32)
      (i32.const 1)
      (then
        (if (result i64)
          (i32.const 1)
          (then (i64.const 2))
          (else (i64.const 3))
        )
      )
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)