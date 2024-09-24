;; 9. **Test Case 9**: A `loop` with depth-based label indices being used in `br_table`.    - **Constraint**: Ensuring that the label indexing within `br_table` correctly aligns with loop depth.    - **Relation to br_table Edge Case**: Tests the handling of label indices in deep nested loop scenarios.

(assert_invalid
  (module (func $br_table-nested-loops (param i32) (result i32)
    (local i32)
    (loop (result i32)
      (loop (result i32)
        (block (result i32)
          (br_table 0 1 2 (local.get 0))
        )
      )
    )
  ))
  "type mismatch"
)