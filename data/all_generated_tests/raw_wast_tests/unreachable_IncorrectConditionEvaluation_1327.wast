;; 8. **Test Description:**    - Use `unreachable` inside a nested loop within an `if` construct, where the loop exits conditionally based on `br_if`. Place `unreachable` within the inner loop conditioned branch. Make sure the outer conditional logic routes correctly.    - Constraint: Complex structures with layered conditionals.    - Relation to Incorrect Condition Evaluation: Tests multiple layers of conditionals reflect correct control flow.

(assert_invalid
  (module
    (func $test
      (if (i32.const 1)
        (then
          (loop 
            (if (i32.const 0)
              (then
                (unreachable)
              )
            )
            (br_if 1 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)