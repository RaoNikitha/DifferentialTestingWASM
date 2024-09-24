;; 7. **Test for Negative Index Handling**:    - (If allowed by the spec) Using a negative index for `br_table` within a block.    - *Constraint*: Ensures proper resolution or error handling of negative indices.    - *Relation*: Tests if the implementation correctly manages unexpected negative values in label stacks.

(assert_invalid
  (module (func $negative-index-br_table
    (block (br_table -1))
  ))
  "invalid index"
)