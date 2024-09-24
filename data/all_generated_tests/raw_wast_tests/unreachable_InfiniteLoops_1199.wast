;; 10. **Test 10:** Implement a doubly nested loop where the inner loop never ends unless `unreachable` is executed in the outer loop.     - **Constraint:** Ensure `unreachable` in an outer loop breaks the inner loop's infinite execution.     - **Relation to Infinite Loops:** Confirms outer loop control can terminate an inner infinite loop due to `unreachable`.

(assert_invalid
  (module (func $doubly_nested_loop_unreachable (loop (loop (br 0)) (unreachable)))
  )
  "type mismatch"
)