;; 7. **Test Case: Branch Table with Complex Targets**    - **Test Description**: Create a `br_table` instruction within multiple nested blocks. The table should have multiple entries, some targeting different depths of nested blocks. Test that each entry correctly redirects control and maintains stack integrity.    - **Constraint**: Validates that the `br_table` correctly resolves target labels based on nesting depth.    - **Relation to Mismanagement**: Mismanagement issues will surface if the `br_table` fails to find the accurate block level for control transfers.

(assert_invalid
  (module
    (func $br_table_with_nested_blocks
      (block (block (block
        (block (result i32)
          (block (br_table 1 2 0 (i32.const 3)))
          (i32.const 0)
        )
        (i32.add (i32.const 1) (br 0 (i32.const 2)))
      )))
    )
  )
  "type mismatch"
)