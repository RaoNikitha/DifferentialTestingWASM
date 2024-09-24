;; 9. **Test Non-Existent Label Default in `br_table`**:    - **Description**: Execute a `br_table` where the default label does not exist.    - **Reasoning**: Verifies error handling for missing default branches.    - **Edge Relation**: Pressure-tests resilience and default behavior of conditional branches.

(assert_invalid
  (module
    (func $test-non-existent-label-default-in-br_table
      (block
        (br_table 0 1 2 (i32.const 3))
      )
    )
  )
  "unknown label"
)