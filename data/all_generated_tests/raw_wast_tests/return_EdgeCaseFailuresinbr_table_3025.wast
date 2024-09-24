;; 4. **Default Case Only**:    - Create a `br_table` instruction where only a default target is provided with an index set to `0`.    - **Constraint**: Checks behavior when `br_table` must always fall back to the default target.    - **Edge Case**: Makes sure the implementation does not misinterpret the sole index.

(assert_invalid
  (module
    (func $default-case-only
      (block (br_table 0 (return)))
    )
  )
  "type mismatch"
)