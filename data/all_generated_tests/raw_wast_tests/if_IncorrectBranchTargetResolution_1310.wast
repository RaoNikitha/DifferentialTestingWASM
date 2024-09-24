;; 1. **Test: Missing Label in `if` Instruction**:    - **Description**: Write an `if` block with a `br` instruction targeting an index that exceeds the actual nesting levels available.    - **Constraint**: This ensures the validator must correctly identify an out-of-bounds label reference, resulting in a validation error.    - **Relation to Branch Target Resolution**: This tests whether the target label validity within an `if` block is accurately checked by both implementations.

(assert_invalid
  (module (func $invalid_label_index
    (if (result i32)
      (i32.const 1)
      (then (br 1))
      (else (i32.const 0))
    )
  ))
  "unknown label"
)