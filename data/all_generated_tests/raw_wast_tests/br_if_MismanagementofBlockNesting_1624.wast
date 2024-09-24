;; 5. **Test 5**: - **Description**: Nested conditional branches (`if` structures) inside a `block` with `br_if` targeting the block from the deepest nested `if`. - **Constraint Checked**: Accurate branch targeting across nested conditional structures.

(assert_invalid
  (module
    (func
      (block $outer
        (if (i32.const 1)
          (then
            (if (i32.const 1)
              (then
                (br_if $outer (i32.const 1))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)