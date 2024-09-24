;; 7. **Nested `br_table` within Loop:**    - Description: Place a `br_table` inside a nested loop structure, with some labels pointing outside the loop.    - Ensure that the control transfer correctly breaks out of nested loops and resumes at the specified labels.    - Specific Constraint: Validate correct label indexing and branching within deeply nested structures.

(assert_invalid
  (module
    (func $nested-br_table
      (block $outer
        (loop $inner
          (br_table $outer $inner (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)