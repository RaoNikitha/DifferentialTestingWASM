;; 1. **Test Description**: Create a `block` with a `br_table` instruction where the table index exceeds the number of available labels within the block.    - **Constraint**: Ensure that the `block` correctly unwinds the operand stack and branches to the default case when the index is out of bounds.    - **Edge Case**: This test evaluates how the implementation handles an index that is out of bounds, checking for proper default handling.

(assert_invalid
  (module (func (block (br_table 0 1 2) (block (nop)))))
  "unknown label"
)