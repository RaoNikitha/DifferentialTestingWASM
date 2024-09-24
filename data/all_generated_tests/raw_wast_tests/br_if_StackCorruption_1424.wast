;; 5. **Test Description**:     Use a function with multiple nested `block` constructs and `br_if` instructions targeting different levels. Confirm that branch targets are valid and that stack heights are preserved across multiple nested levels.    - **Constraint Checked**: Proper targeting and stack handling within deeply nested blocks.    - **Stack Corruption Check**: Prevents stack corruption due to invalid nested `br_if` targets.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (block
            (br_if 2 (i32.const 1))
            (i32.const 0)
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)