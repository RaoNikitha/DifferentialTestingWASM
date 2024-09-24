;; 9. **Single Label with Varied Indexes**:    - Set a block containing a `br_table` instruction where there's only one label provided and multiple index values are used. Verify if all branches correctly resolve to the lone target.    - **Constraint Checked**: Uniform redirection to a single target label.

(assert_invalid
  (module
    (func (block (br_table 0 0 0) (nop) (nop)))
  )
  "type mismatch"
)