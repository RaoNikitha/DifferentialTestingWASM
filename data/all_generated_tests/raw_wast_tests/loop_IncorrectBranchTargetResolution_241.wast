;; 2. **Test 2: Branch Within Same Loop**    - Description: Design a single loop where a `br` instruction targets the same loop. Ensure that the branch correctly jumps back to the start of the loop and does not exit unexpectedly or enter an infinite loop.    - Constraint: Verifies the implicit label handling of self-targeted branches.

(assert_invalid
  (module
    (func $branch-within-same-loop
      (loop (result i32)
        (i32.const 0)
        (br 0)
      )
    )
  )
  "unreachable code must be removed"
)