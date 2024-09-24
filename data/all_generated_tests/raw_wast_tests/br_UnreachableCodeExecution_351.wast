;; 2. **Test Description:**    - **Test Scenario:** Create a `loop` with an inner block that contains an `unreachable` instruction. Use `br` to exit the loop.    - **Specific Constraint:** Check the correctness of the control flow when the `br` instruction unwinds the stack and exits the loop.    - **Relation to Unreachable Code Execution:** Ensure that the `br` instruction does not erroneously cause the control flow to reach the `unreachable` instruction inside the loop.

(assert_invalid
  (module
    (func $test
      (loop $loop_label
        (block $block_label
          (unreachable)
          (br $loop_label)
        )
      )
    )
  )
  "unreachable code"
)