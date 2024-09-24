;; 7. **Multiple Nested `br_table`**:    - Develop a block with nested `br_table` instructions, ensuring inner blocks correctly handle branches directed by outer blocks when indices refer to nested structures.    - **Constraint Checked**: Nesting and unwinding of label stacks during multiple `br_table` evaluations.

(assert_invalid
  (module (func $nested-br-table
    (block $outer (block $inner (br_table 0 1 (i32.const 0))))
  ))
  "type mismatch"
)