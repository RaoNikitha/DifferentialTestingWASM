;; 6. **Test Description**:    - **Test Name**: NestedIfConditionCheck    - **Test Goal**: Test the handling of nested `if` conditions with mixed true and false evaluations.    - **Specific Constraint**: Correct evaluation and branching in nested `if-else` structures.    - **Relation to Incorrect Condition Evaluation**: Verifies nested condition evaluations are respected and properly branched.

(assert_invalid
  (module (func $nested-if-condition-check (result i32)
    (i32.const 1)
    (if (result i32)
      (then
        (i32.const 0)
        (if (result i32)
          (then (i32.const 42))
          (else (i32.const 99))
        )
      )
      (else (i32.const 5))
    )
  ))
  "type mismatch"
)