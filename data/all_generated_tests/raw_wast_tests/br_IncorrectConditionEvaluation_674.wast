;; 5. **Test 5: Incorrect Condition Evaluation with Zero Comparison**    - Use a condition `i32.eqz` (zero comparison) with an input of `i32.const 0` in the `br_if` instruction. Verify if the branch is properly taken due to the condition being true.    - **Constraint Checked**: Correct evaluation of zero comparison condition.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block
          (br_if 0 (i32.eqz (local.get 0)))
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)