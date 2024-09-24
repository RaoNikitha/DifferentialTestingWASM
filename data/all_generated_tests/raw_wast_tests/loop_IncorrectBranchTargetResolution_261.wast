;; 2. **Nested Loop with Incorrect Branch Target**:    Create nested loops where a branch instruction within the inner loop tries to reference a label that should only be valid in the outer loop. This ensures checks on proper context extension and label resolution.

(assert_invalid
  (module (func $nested-loop-invalid-branch
    (loop (result i32)
      i32.const 1
      (loop (result i32)
        i32.const 2
        br 2
      )
    )
  ))
  "unknown label"
)