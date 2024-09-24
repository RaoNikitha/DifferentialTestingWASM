;; 3. **Nested Loop with Unreachable in Inner Loop**:    Implement a nested loop where the inner loop contains an `unreachable` instruction. Ensure outer loop branches directly to the start of inner loop, checking if improper label management leads to `unreachable` execution.

(assert_invalid
  (module (func $nested_loop_unreachable
    (loop (result i32)
      (loop (result i32)
        unreachable
      )
      br 1
    )
  ))
  "type mismatch"
)