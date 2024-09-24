;; 3. **Incorrect Branch Index**:    - **Test Description**: Use a `br` or `br_if` instruction that targets a non-existent or improperly scoped block label.    - **Reasoning**: This test verifies that branching instructions are correctly resolving labels and that improper branches are caught, maintaining CFG integrity.    - **Constraint checked**: Label Indexing Rule    - **Relation to CFG**: Ensures the CFG correctly identifies and handles branches, maintaining accurate execution paths.

(assert_invalid
  (module (func (block (br 1))))
  "unknown label"
)