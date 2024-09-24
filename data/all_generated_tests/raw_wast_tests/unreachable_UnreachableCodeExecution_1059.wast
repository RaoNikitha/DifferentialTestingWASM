;; 10. Create multiple functions where each expects valid stack operations but conclude with an `unreachable` instruction, ensuring the unreachable leads to a trap immediately when executed in all scenarios.

(assert_invalid
  (module (func $test-unreachable (i32.const 0) (i32.const 1) (unreachable) (i32.add)))
  "type mismatch"
)