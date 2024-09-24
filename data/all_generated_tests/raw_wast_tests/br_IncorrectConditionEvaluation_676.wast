;; 7. **Test 7: Incorrect Condition Evaluation with Deeply Nested Conditions**    - Construct a deeply nested block or loop structure where the `br_if` condition evaluates a deeply nested comparison. Validate correct branching behavior.    - **Constraint Checked**: Consistency in condition evaluation across deeply nested constructs.

(assert_invalid
  (module
    (func $deeply_nested_conditions
      (block
        (loop
          (block
            (br_if 0
              (i32.eq
                (i32.const 0)
                (i32.sub
                  (i32.const 1)
                  (block (result i32)
                    (loop (result i32)
                      (i32.const 2)
                      (br 1)
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)