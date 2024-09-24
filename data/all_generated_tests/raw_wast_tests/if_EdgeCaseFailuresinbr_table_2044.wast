;; 5. **Test Description**:     Create an `if` block with an unreachable instruction leading to a `br_table` in the `else` branch, where the index is out of bounds.    **Constraint**: Ensures proper trapping behavior for `unreachable` combined with an invalid `br_table` index.    **Edge Case Relation**: Evaluates how unreachable code paths impact `br_table` handling.

(assert_invalid
  (module
    (func $unreachable-br-table-out-of-bounds
      (if
        (i32.const 0)
        (then (unreachable))
        (else (br_table 1 (i32.const 1)))
      )
    )
  )
  "unknown label"
)