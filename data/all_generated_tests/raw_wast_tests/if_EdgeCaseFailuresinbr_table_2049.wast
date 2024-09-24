;; 10. **Test Description**:     Construct an `if` block intertwined with a `loop` block where the `else` contains a `br_table` leading out of the loop with out-of-bounds index.    **Constraint**: Tests the combined control flow handling of `if` and `loop` for `br_table`.    **Edge Case Relation**: Evaluates if complex control structures maintain consistent `br_table` enforcement of out-of-bounds indices.

(assert_invalid
  (module
    (func $if-loop-br_table-out-of-bounds
      (i32.const 0)
      (loop (result i32)
        (if (result i32) (i32.const 0)
          (then (i32.const 10))
          (else (br_table 1 (i32.const 0)))
        )
      )
      (drop)
    )
  )
  "invalid br_table target"
)