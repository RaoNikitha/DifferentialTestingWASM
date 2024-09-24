;; 6. **`br_table` with Multiple Loop Layers**:    - **Description**: Nest several loops and use a `br_table` inside the innermost loop, with indices targeting multiple loop layers.    - **Constraint**: Ensures correct label indexing and target addressing across multiple nested loops.

(assert_invalid
  (module
    (func $br_table-multi-loop
      (i32.const 0)
      (loop (loop (loop
        (block
          (br_table 0 1 2 (i32.const 2))
          (nop)
        )
      )))
    )
  )
  "type mismatch"
)