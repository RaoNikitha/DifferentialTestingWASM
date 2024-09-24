;; 1. **Test Nested `if` Blocks Without `else` Clauses**:    - Validate nested `if` blocks where none of the blocks use the `else` clause, ensuring all nested control flow paths are evaluated properly without triggering improper CFG creation.    - **Constraint Checked**: verifies that the CFG correctly handles nested control without `else`.

(assert_invalid
  (module
    (func $nested-if-blocks
      (i32.const 1)
      (if (i32.const 1)
        (if (i32.const 0)
          (if (i32.const 1)
            (i32.const 2)
          )
        )
      )
    )
  )
  "type mismatch"
)