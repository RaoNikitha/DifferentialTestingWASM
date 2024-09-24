;; - **Test 8**: Perform a test with nested loops, where each nested loop alters the stack height and values. Branches within these nested loops should retrace accurately back to their originating loops. Validate if the branching mechanism keeps the stack state synchronized and correct across depths.

(assert_invalid
  (module (func $nested-loops
    (loop $outer (result i32)
      i32.const 1
      (loop $inner (result i32)
        i32.const 2
        br $inner
      )
      drop
      br $outer
    )
  ))
  "type mismatch"
)