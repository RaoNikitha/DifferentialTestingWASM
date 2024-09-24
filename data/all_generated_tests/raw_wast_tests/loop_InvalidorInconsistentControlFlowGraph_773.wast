;; 4. **Empty Loop**:    - **Description**: Test an empty loop that contains no instructions between `loop` and `end`.    - **Constraint Checked**: Validates well-nested structure and checks for correct initialization.    - **Relation to CFG**: An empty loop might lead to optimization issues or infinite loops if not correctly handled in the CFG.

(assert_invalid
  (module (func (loop) end))
  "loop must contain a valid block type"
)