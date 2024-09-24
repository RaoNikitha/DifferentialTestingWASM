;; 2. **Test Description**:     Design a loop structure containing a nested block with a `br_table` instruction referencing multiple branches, including a default branch. Use varying indices, some of which exceed the branch target array size, to validate that excess indices trigger the default branch correctly.    **Constraint**: Verify proper redirection to the default branch on out-of-bounds indices.    **Relation to `br_table` Edge Cases**: Demonstrates how out-of-bound indices should properly fallback to the default label.

(assert_invalid
  (module
    (func $nested-br_table-loop
      (block $outer
        (loop $inner
          (block $mid
            (br_table $outer $mid $inner 3  ;; Index 3 is out of bounds
              (i32.const 3))
          )
        end)
      )
    )
  )
  "unknown label"
)