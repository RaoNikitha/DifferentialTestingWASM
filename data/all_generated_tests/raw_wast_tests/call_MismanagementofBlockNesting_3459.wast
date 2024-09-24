;; 8. **Calls in Nested Blocks with Variable Capture**:    - **Test Description**: Have nested blocks where a called function captures variables defined in outer blocks, affecting their values. Ensure correct variable scope and lifecycle management.    - **Constraint Checked**: Capture and lifespan of variables in nested calls.    - **Relation to Mismanagement of Block Nesting**: Validates that function calls respect the scopes created by nested blocks.

(assert_invalid
  (module
    (func (param i32) (local i32)
      (block
        (block
          (local.set 1 (i32.const 42))
          (block
            (call 1)
          )
          (local.get 1)
        )
      )
    )
    (func (param i32))
  )
  "type mismatch"
)