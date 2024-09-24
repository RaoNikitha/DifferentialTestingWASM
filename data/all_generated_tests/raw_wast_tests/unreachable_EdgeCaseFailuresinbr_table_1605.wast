;; 6. **Test Description:**    - Use `br_table` in a loop with varying indices and insert `unreachable` at random points to see if the trap is triggered consistent with index-based jumps.    - **Constraint:** Ensures each loop iteration triggering `unreachable` avoids all branch target executions.    - **Relation to Edge Case:** Verifies robustness in looping control flow with `unreachable`.

(assert_invalid
  (module
    (func $test-loop-unreachable
      (loop $loop
        (br_table 0 0 (i32.const 1))
        (unreachable)
      )
    )
  )
  "type mismatch"
)