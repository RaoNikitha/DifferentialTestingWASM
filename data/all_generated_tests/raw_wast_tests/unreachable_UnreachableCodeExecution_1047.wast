;; 8. **Trap Handling and Reporting:**    - **Description:** Generate a trap with `unreachable`, then use try-catch equivalent constructs to verify the trap is consistently handled and reported.    - **Constraint:** Verifies error handling mechanisms.    - **Relation to Unreachable Code Execution:** Ensures consistent trap reporting and handling across implementations.

(assert_invalid
  (module (func $trap-handling (try (do (unreachable)) (catch_all (drop (i32.const 1))))))
  "type mismatch"
)