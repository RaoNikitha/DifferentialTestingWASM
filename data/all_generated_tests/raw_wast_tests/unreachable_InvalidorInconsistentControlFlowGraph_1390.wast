;; 1. **Test Unreachable within Valid Loop:**    - Context: Place an `unreachable` instruction directly inside a loop, immediately followed by an instruction normally valid in the loop context.    - Constraint: Verify if the CFG correctly identifies that the loop’s body cannot proceed beyond the `unreachable`, ensuring control flow is consistently terminated.    - Expected Behavior: Both implementations should trap correctly without further loop body execution.

(assert_invalid
  (module (func $test_unreachable_in_loop
    (loop 
      unreachable
      br 0
    ))
  )
  "type mismatch"
)