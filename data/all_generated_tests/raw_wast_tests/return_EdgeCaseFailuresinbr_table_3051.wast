;; 10. **Test with Mixed-Type Values on Stack Before `br_table`**:    - **Description**: Push mixed-type values (e.g., integers and floats) onto the stack before executing the `br_table` instruction, followed by a `return`.    - **Relation to Edge Case**: Tests if the stack unwinding done by the `return` instruction correctly handles mixed-type values and maintains type consistency post-branch.

(assert_invalid
  (module
    (func $type-mixed-values-in-br_table (result i32)
      (i32.const 1)
      (f32.const 2.0)
      (f64.const 3.0)
      (i32.const 4)
      (block (br_table 0) (return))
    )
  )
  "type mismatch"
)