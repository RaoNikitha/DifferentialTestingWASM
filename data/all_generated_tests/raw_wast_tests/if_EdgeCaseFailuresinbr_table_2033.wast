;; 4. **Test Name: Nested `br_table` with Intermediate `if` blocks**    - **Description**: This complex test input includes nested `if` blocks where each nesting level also incorporates a `br_table`. This checks how well the implementation manages stack unwinding and control flow with multiple levels of conditional and indirect branching.    - **Constraint Checked**: Consistent stack unwinding and label referencing within nested control structures.    - **Relation to Edge Case**: Confirms robust handling of nested conditional and indirect branches.

(assert_invalid
  (module
    (func $nested-br_table-if
      (block $outer
        (br_table $outer (i32.const 0) (if (i32.const 1)
          (then
            (block $inner
              (br_table $inner (i32.const 0) (if (i32.const 1)
                (then (br $inner))
              ))
            )
            (br $outer)
          ))
        ))
      )
    )
  )
  "type mismatch"
)