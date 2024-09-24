;; 3. **Backward Branch to Unreachable**:    Create a loop with a backward branch (`br 0`) targeting a block of code that contains an `unreachable` instruction. The loop should trap when the backward branch leads to the `unreachable`.

(assert_invalid
  (module
    (func $backward-branch-unreachable
      (loop (br 0) (unreachable))
    )
  )
  "unreachable executed"
)