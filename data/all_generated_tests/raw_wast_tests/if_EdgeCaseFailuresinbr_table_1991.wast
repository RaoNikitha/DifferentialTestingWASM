;; 2. **Test Description**: Validate `if` condition true with an immediately nested `br_table` instruction that references a single out-of-bound target.    - **Constraint**: Ensure that `if` instruction can properly handle an invalid `br_table` target within its true block.    - **Relation to Edge Case**: This checks if the branching correctly identifies and manages invalid references within nested blocks.

(assert_invalid
  (module
    (func
      (if (i32.eqz (i32.const 0))
        (then
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "invalid label"
)