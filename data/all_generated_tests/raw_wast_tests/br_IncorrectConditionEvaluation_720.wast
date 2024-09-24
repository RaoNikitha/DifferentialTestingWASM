;; 1. **Test Description:**    Validate a scenario where a `br_if` instruction is used within a nested `block`, with the condition designed to evaluate to `true`. Verify that the outer `block` is exited correctly when the condition is met.    - **Constraint Checked:** Correct evaluation of `br_if` condition within nested blocks.    - **Relation to Incorrect Condition Evaluation:** Ensures that the condition check doesn’t incorrectly skip the branch when the condition is `true`.

(assert_invalid
  (module
    (func $conditional-branch-within-nested-blocks
      (block
        (block
          (br_if 1 (i32.const 1))  ;; Condition is true
          (br 0)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)