;; 3. **`br_table` with Negative Index Operand**:    - **Description**: Test a `br_table` instruction inside a loop with a negative index operand to check if the implementation correctly handles negative indexing.    - **Constraint**: Ensures the proper normalization and handling of invalid, negative indices in branch tables.

(assert_invalid
 (module
  (func (loop (block (br_table 0 -1))))
 )
 "invalid label index"
)