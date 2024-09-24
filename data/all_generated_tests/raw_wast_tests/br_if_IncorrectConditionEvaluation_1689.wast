;; 10. **Test Description:** Test `br_if` instruction in conjunction with `tee_local` to push the condition twice, ensuring the condition is consistently evaluated and leads to appropriate branching decision.    - **Specific Constraint:** Validate condition correctness with duplicated stack pushes.    - **Relation to Incorrect Condition Evaluation:** Confirms consistent conditional logic through redundant data pushes and evaluations.

(assert_invalid
  (module
    (func $test-tee-local-br_if
      (local $condition i32)
      (block
        (br_if 0
          (i32.eq
            (tee_local $condition (i32.const 1))
            (tee_local $condition (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)