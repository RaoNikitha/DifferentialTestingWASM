;; 9. **Test Description**:    - **Test Name**: UnmatchedBlockTypes    - **Test Goal**: Ensure blocks matched correctly without erroneous condition evaluations.    - **Specific Constraint**: Error-handling for unmatched block types during condition checks.    - **Relation to Incorrect Condition Evaluation**: Tests for error handling consistency during mismatched `then` and `else` execution stemming from condition errors.

(assert_invalid
  (module
    (func $unmatched-block-types
      (if (result i32)
        (i32.const 1) (then (i32.const 1)) 
        (else (i64.const 1))
      )
    )
  )
  "type mismatch"
)