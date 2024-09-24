;; 10. **Mismatched Block Types Across Nested Loop Levels**:     Construct loops with mixed block types nested within each other while repeatedly branching using `br_table`.     Checks the integrity of block type management and correctness during cross-level indirect branching.

(assert_invalid
  (module
    (func $mismatched-block-types (result i32)
      (loop (result i32) 
        (block (result i32)
          (loop (result f32)
            (block (result f32)
              br_table 1 0
              unreachable
            )
          )
        )
      )
    )
  )
  "type mismatch"
)