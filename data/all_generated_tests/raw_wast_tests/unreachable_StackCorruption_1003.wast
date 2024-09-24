;; 4. **Nested `try-catch` with `unreachable`:**    - **Description:** Implement a nested `try-catch` structure where the innermost block contains an `unreachable` instruction, checking if traps lead to proper stack unwinding.    - **Constraint:** The outer `catch` should handle the trap correctly without stack corruption.    - **Relation to Stack Corruption:** Tests for stack state consistency in nested control flows.

(assert_invalid
  (module (func $nested-try-catch-unreachable
    (block
      (block (unreachable) (catch 0))
      (catch_all (i32.const 0))
    )
  ))
  "type mismatch"
)