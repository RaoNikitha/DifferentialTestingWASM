;; 4. **Test Description:** Execute a function containing a sequence of valid instructions followed by an `unreachable` instruction at the end.    **Constraint:** The `unreachable` instruction should cause an immediate trap after executing the valid instructions.    **Relation to Unreachable Code Execution:** Ensures that the `unreachable` instruction effectively halts the function’s execution.

(assert_invalid
  (module (func $type-valid-then-unreachable
    (i32.const 10)
    (i32.const 20)
    (i32.add)
    (unreachable)
    (i32.const 5)
  ))
  "type mismatch"
)