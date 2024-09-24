;; 5. **Test with Nested Blocks and Out-of-Bound `br_table`**:    - Nested `block` instructions where the inner block contains a `br_table` with an out-of-bound index targeting the outer block.    - Tests the `br_table` handling of nested context and correct label resolution.    - Edge Case: Cross-nesting management in wizard_engine, involving `resetInit`, might incorrectly resolve or manage the nested label context.

(assert_invalid
  (module (func (block (block (br_table 1 1))))
  )
  "branch table index out of range"
)