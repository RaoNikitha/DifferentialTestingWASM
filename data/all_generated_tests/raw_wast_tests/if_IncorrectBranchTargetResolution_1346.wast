;; 7. **Branching to Nonexistent Labels**:    - Define an edge case where a `br` instruction in an `if` block references a non-existent label. Proper handling should trigger an error or trap, checking the robustness of label resolution error detection.    - **Constraint**: Ensure accurate error handling for attempts to branch to unresolved or non-existent labels.

(assert_invalid
  (module (func (if (i32.const 1) (then (br 1)) (else (br 2))))
  )
  "unknown label"
)