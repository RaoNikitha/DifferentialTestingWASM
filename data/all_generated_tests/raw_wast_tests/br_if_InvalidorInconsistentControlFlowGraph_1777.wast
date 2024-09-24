;; 8. **Test Case 8**: Create a block encapsulating another block with conditional `br_if` repeatedly jumping between the same set of blocks, testing nested label indexing consistency.    - **Constraint Checked**: Consistent stack behavior and proper indexing with repeated jumps.    - **CFG Relation**: CFG becoming convoluted with multiple internal branches, testing for loop and block jump consistency.

(assert_invalid
  (module
    (func $nested-br_if-loops
      (block $outer
        (block $inner
          (br_if 1 (i32.const 1))
          (br_if 0 (i32.const 1))
        )
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)