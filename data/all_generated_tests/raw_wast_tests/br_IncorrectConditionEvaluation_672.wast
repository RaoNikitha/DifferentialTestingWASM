;; 3. **Test 3: Incorrect Condition Evaluation with Nested Conditions**    - Create a nested structure with multiple `if` statements, and a `br_if` inside one of the innermost blocks, with a condition that evaluates to true.     - **Constraint Checked**: Correct handling of nested condition evaluations in branching.

(assert_invalid
  (module
    (func $incorrect-condition-evaluation
      (block
        (block
          (block
            (if (i32.const 1)
              (then
                (block (br_if 0 (i32.const 1)))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)