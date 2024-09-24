;; 10. **Test Description**: Nested `br_table` instructions where the outer table has fewer targets than the inner one, and index selection varies between both scopes.     - **Constraint Checked**: Proper resolution of nested `br_table` instructions and differing target counts.     - **Edge Case Relation**: Tests nested control flow nuances and ensures no crossing of bounds between nested structures.

(assert_invalid
  (module (func $nested-br-table
    (block (block 
      (br_table 0 1 (i32.const 1))
      (block 
        (br_table 0 (i32.const 1))
      )
    ))
  ))
  "invalid index"
)