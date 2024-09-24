;; 6. Create multiple branches within a `br_table` with a contingent fall-through path leading to an `unreachable` instruction. Ensure that setting the largest correct index never proceeds and always traps.

(assert_invalid
  (module (func $test-unreachable-br_table
    (block (br_table 0 0 0 1 (unreachable)))
    (i32.const 0)
  ))
  "type mismatch"
)