;; 10. **Test Description**: Stack multiple `if` constructs within a single `block`, with a `br_if` targeting a specific `if` inside. Validate if the conditional branch respects the targeted `if`'s position and maintains stack integrity.    - **Constraint Checked**: Proper indexing for targeting nested `if` within a `block`.    - **Relation to Mismanagement of Block Nesting**: Label index miscalculation can lead to branching to incorrect or nested conditional blocks.

(assert_invalid
  (module
    (func $multiple-if-in-block
      (block
        (if (i32.const 1)
          (then)
        )
        (if (i32.const 1)
          (then
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)