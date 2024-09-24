;; 1. **Simple Loop with Unreachable Post-Branch**:    Create a loop that branches unconditionally (`br 0`) but places an `unreachable` instruction immediately after the loop block, testing if execution ever reaches the `unreachable` due to incorrect control context extension.

(assert_invalid
  (module (func $simple_loop_unreachable_post_branch
    (loop (br 0) (unreachable) end)
  ))
  "unreachable code"
)