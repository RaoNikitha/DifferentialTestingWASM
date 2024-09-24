;; 1. **Nested Loop Without Proper Context Extension**:     - **Description**: Construct a nested loop where the inner loop does not correctly extend the context with the new label `[t*1]`, resulting in mismanaged label indices for branches inside the inner loop.     - **Constraint**: Testing context extension with nested loops.     - **CFG Impact**: Incorrect context extension may lead to improper label handling causing invalid branches to be taken.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1)
        (loop (result i32)
          (br 2)
        )
      )
    )
  )
  "invalid branch depth"
)