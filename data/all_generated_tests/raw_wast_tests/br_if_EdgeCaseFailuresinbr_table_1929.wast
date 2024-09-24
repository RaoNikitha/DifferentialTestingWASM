;; 10. **Test Edge Case Index Just Outside Label Range in `br_table`**:     - **Description**: Use an index just one greater than the highest valid label index in `br_table`.     - **Reasoning**: Checks edge handling for near-boundary label indices, ensuring fallback target reliability.     - **Edge Relation**: Evaluates subtle errors in index bounds management.

(assert_invalid
  (module (func $edge-case-br_table
    (block (br_table 1 0 (i32.const 2)))
  ))
  "unknown label"
)