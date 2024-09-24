;; 2. **Test Description**:     Construct an `if` block without a direct `else`, but containing a nested block that contains a `br_table` index out of bounds.    **Constraint**: Ensures `br_table` properly manages nested indirect branches.    **Edge Case Relation**: Validates the handling of nested out-of-bounds branches within blocks that are indirectly part of the `if` control flow.

(assert_invalid
  (module
    (func $test-block-with-br_table
      (result i32)
      (if (result i32) (i32.const 1)
        (then
          (block
            (i32.const 0)
            (br_table 1 0)
            (i32.const 42)
          )
        )
        (i32.const 0)
      )
    )
  )
  "unknown label"
)