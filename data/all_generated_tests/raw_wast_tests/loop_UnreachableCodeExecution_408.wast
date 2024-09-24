;; 9. **Unreachable in Conjunction with Memory Operations**:    Create a loop that executes valid memory operations (load/store) ending with an `unreachable` instruction to test if the correct memory operations are performed before triggering a trap.

(assert_invalid
  (module (func $test-loop-unreachable-memory
    (loop (result i32)
      (i32.const 0)
      (i32.load)
      (unreachable)
    )
  ))
  "type mismatch"
)