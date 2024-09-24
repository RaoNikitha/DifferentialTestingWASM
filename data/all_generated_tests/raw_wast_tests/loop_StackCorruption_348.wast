;; 9. **Interruptions with Stack Cleanup**    - Use loops incorporating clean-up operations (e.g., `drop` instruction) in synchronization with `br` and `br_if`. This tests the proper unwinding and maintenance of the stack once a branch is invoked.

(assert_invalid
  (module (func $test-loop-stack-cleanup (result i32)
    (loop (result i32) 
      (i32.const 1)
      (drop)
      (br 0)
    )
  ))
  "type mismatch"
)