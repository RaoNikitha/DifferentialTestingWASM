;; Test 2: - Use multiple `if` statements nested within `block` and utilize `br_if` to target label `1`. Confirm whether the execution jumps to the block enclosing the innermost `if`. Inconsistent label resolution might show different execution paths. - **Constraint Checked**: Label Lookup Mechanism. - **Relation to Incorrect Branch Target Resolution**: Verifies that `br_if` targets the correct label despite multiple layer nesting.

(assert_invalid
  (module
    (func
      (block
        (block
          (if (i32.const 1)
            (then
              (br_if 1 (i32.const 1))
            )
          )
        )
        (i32.const 0) (i32.const 0)
      )
    )
  )
  "unknown label"
)