;; 6. **Backward Branch within Nested Loop and Followed by Unreachable**:    In a nested loop structure, incorporate a backward branch (`br`) in the inner loop followed by an `unreachable`. Verify if mismanagement of backward branching can execute `unreachable`.

(assert_invalid
  (module (func $nested-loop-backward-branch-unreachable (result i32)
    (block (loop (loop (result i32)
      (br 1)
      (unreachable)
    )))
  ))
  "type mismatch"
)