;; 2. **Incorrect Loop Target Test**:    - Define a loop within a block, and use the `br` instruction to incorrectly target the block index instead of the loop index. Verify that the control flow correctly resumes at the loop's beginning and does not wrongly exit to the block. This checks the correct resolution and behavior of backward branches to loops.

(assert_invalid
  (module
    (func $incorrect_loop_target
      (block
        (loop
          (br 1)
        )
      )
    )
  )
  "invalid target label"
)