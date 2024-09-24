;; 3. **Loop with Unreachable Instruction:**    - **Description:** Place an `unreachable` instruction inside a loop which is immediately executed. The loop should trigger a trap on its first iteration.    - **Constraint:** Verifies loop control flow handling.    - **Relation to Unreachable Code Execution:** Tests the consistency of loop execution leading to `unreachable`.

(assert_invalid
  (module (func 
    (loop (unreachable))
  ))
  "unreachable"
)