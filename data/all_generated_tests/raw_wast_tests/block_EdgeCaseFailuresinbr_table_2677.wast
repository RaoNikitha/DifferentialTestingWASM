;; 8. **Test Description**: Create a `block` with a `br_table`, where the target indices refer to another `br_table` within a different nested block, with some indices exceeding the available targets.    - **Constraint**: Verify that the `br_table` correctly handles nested `br_table` instructions and invalid targets by resolving them to the appropriate default branches.    - **Edge Case**: Nesting br_table within br_table to check deep index resolution.

(assert_invalid
  (module
    (func $nested-br-tables
      (block (result i32)
        (block (result i32)
          (br_table 0 1 2 (i32.const 2))
          (block (br_table 0 1 2 (i32.const 3)))
        )
      )
    )
  )
  "type mismatch"
)