;; 1. **Test for Unintended Branch Always Taking Path**:    - Construct a `br_if` instruction within an `if` block where the condition is dynamically computed. Ensure the condition is evaluated to false but verify if the branch still occurs. This tests if the condition is correctly evaluated or if the branch is always taken irrespective of the false condition.

(assert_invalid
  (module
    (func $unintended-branch-always-taking-path
      (block (result i32)
        (if (i32.const 0)
          (then (br 0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)