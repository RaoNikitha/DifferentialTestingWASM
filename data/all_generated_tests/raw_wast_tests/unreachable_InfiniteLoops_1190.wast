;; 1. **Test 1:** Evaluate if an `unreachable` instruction inside a loop properly causes a trap before the loop condition is evaluated.    - **Constraint:** Check if placing `unreachable` at the start of a loop terminates the loop immediately.    - **Relation to Infinite Loops:** Prevents loop execution if properly trapped.

(assert_invalid
  (module (func $unreachable-in-loop
    (loop (br 0) (unreachable)) (i32.const 1) (drop)
  ))
  "type mismatch"
)