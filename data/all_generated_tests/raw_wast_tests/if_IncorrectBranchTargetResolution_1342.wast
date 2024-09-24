;; 3. **Label Conflict in Multiple `if-else` Chains**:    - Create multiple consecutive `if-else` blocks with shared label indices but distinct nesting levels. The objective is to ensure each `br` instruction targets the correct `if` block by recognizing and maintaining unique label contexts despite index overlaps.    - **Constraint**: Differentiating label contexts when indices overlap in consecutive but distinct `if-else` blocks.

(assert_invalid
  (module
    (func $test_multiple_if_else_labels
      (local i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 2)
        (then
          (if (result i32)
            (i32.const 3)
            (then (br 1)) ; attempts to break to the outer `if`
            (else (br 0)) ; attempts to break to this inner `if`
          )
        )
        (else (i32.const 4))
      )
    )
  )
  "label conflict in nested if-else blocks"
)