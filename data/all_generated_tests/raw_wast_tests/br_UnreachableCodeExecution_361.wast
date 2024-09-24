;; 2. **Test Description:** Implement a loop with a `br` that targets a `block` outside the loop. Place an `unreachable` instruction immediately after the `br`. Ensure the `unreachable` is not executed.     - **Constraint Checked:** Proper backward branch to the beginning of a loop versus outward branching.     - **Relation to Unreachable Code Execution:** Checks if the branch jumps back correctly to the beginning of the loop, avoiding the `unreachable` instruction.

(assert_invalid
  (module
    (func $test-loop-block-br (loop (block (br 1) unreachable)))
  )
  "type mismatch"
)