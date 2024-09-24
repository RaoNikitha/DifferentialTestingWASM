;; 4. **Test Description**:     Construct a loop with a `br_table` instruction using indices from a dynamic source (e.g., stack values) to make the indirect branch.     - **Constraint**: Validates if stack-based indices are handled correctly by `br_table`.     - **Edge Case**: Tests for dynamic index values based on execution context for branch selection.

(assert_invalid
  (module
    (func (param i32)
      (block (loop (result i32)
        (block (result i32) (i32.const 1))
        (br_table 0 0 1 (local.get 0))
      ))
      (drop)
    )
  )
  "indirect branch"
)