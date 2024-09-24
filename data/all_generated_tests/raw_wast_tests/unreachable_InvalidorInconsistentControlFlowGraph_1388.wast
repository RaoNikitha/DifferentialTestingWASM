;; 9. **Test: `unreachable` within Infinite Loops**    - **Goal:** Test CFG behavior in infinite loops containing `unreachable`.    - **Description:** Place `unreachable` inside an infinite loop construct to ensure it causes a trap upon execution, preventing the loop from iterating further.    - **Constraint Checked:** CFG handling of infinite loops with `unreachable`.

(assert_invalid
  (module (func $unreachable-in-infinite-loop
    (loop (unreachable))
  ))
  "unreachable in infinite loop"
)