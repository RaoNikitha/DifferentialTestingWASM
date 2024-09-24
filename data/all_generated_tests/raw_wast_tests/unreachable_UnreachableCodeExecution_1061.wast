;; 2. **Test Description:** Place an `unreachable` instruction inside an `if-else` conditional block, where the condition always evaluates to true.    **Constraint:** The `unreachable` instruction should immediately trap when the condition is met.    **Relation to Unreachable Code Execution:** Ensures that the `unreachable` instruction is executed correctly when the path condition is true.

(assert_invalid
  (module (func 
    (if (i32.const 1)
      (then (unreachable))
      (else (i32.const 42))
    )
  ))
  "type mismatch"
)