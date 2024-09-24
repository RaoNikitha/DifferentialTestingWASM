;; 10. **Test Description:**     - Create a loop where an `unreachable` instruction is placed after a conditional operation (checking `i32.eq`) and before a `br` intended to exit on condition failure.    - **Constraint:** Validate that `unreachable` causes an immediate trap regardless of the conditional outcome.    - **Relation to Infinite Loops:** If `unreachable` is incorrectly implemented, loops might not exit properly, causing infinite execution.    - **Expected Behavior:** Trap should occur due to `unreachable`.

(assert_invalid
  (module (func $test-loop-unreachable (param i32) (result i32)
    (loop $loop
      (br_if 0 (i32.eqz (get_local 0)))
      (i32.const 1)
      (unreachable)
      (br $loop)
    )
  ))
  "type mismatch"
)