;; 5. **Test Description:**    - **Test Scenario:** Implement a `loop` inside a block. Inside the loop, place an `unreachable` instruction and use `br` to branch out of the loop to the block.    - **Specific Constraint:** Confirm that backward branches (targeting loops) are handled correctly and do not affect forward branch behavior.    - **Relation to Unreachable Code Execution:** Ensure the `br` instruction correctly exits the loop and that the `unreachable` instruction inside the loop is not executed.

(assert_invalid
  (module
    (func $loop-in-block
      (block
        (loop
          unreachable
          (br 1)
        )
      )
    )
  )
  "unreachable code"
)