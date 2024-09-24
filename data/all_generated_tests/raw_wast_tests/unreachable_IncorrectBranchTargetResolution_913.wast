;; 4. **Test Description:** Create a function with an `if-else` block, having `unreachable` in both branches, and use a `br` instruction to jump to different parts based on a condition.    - **Constraint Checked:** Evaluates handling of `unreachable` within conditional branches and correct `br` resolution.    - **Incorrect Branch Target Relation:** Ensures that `br` correctly skips `unreachable` only as intended by the condition.

(assert_invalid
  (module
    (func $test_unreachable_with_conditional_br (param i32)
      (block
        (if (local.get 0)
          (then
             (br 1)
             (unreachable)
          )
          (else
             (br 1)
             (unreachable)
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)