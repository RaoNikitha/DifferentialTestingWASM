;; 10. **`br_table` with Maximum Valid Index**:     - **Description**: Use a `br_table` inside a loop with the maximum valid index matching exactly the last target in the table.     - **Constraint**: Ensures correct handling at the boundary, verifying implementations correctly resolve the highest possible index target without error.

(assert_invalid
  (module
    (func
      (loop (block (br_table 0 0 0)))
    )
  )
  "invalid branch table index"
)