;; 10. **Test Description**:    - **Constraint Checked**: Multiple nested blocks.    - **Details**: Create a deeply nested block structure with `br_table` and `br_if`, verifying the resolution and branching accuracy through multiple levels.    - **Relation to Edge Case**: Ensures that deeply nested branches resolve correctly with stack unwinding and error handling accurately managed.

(assert_invalid
  (module
    (func $nested-br-if
      (block (result i32)
        (block (result i32)
          (block (br_if 2 (i32.const 1)))
        )
      )
    )
  )
  "unknown label"
)