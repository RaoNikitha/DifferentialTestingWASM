;; 6. **Test Description:**     - Construct a loop where an `unreachable` is placed after a mathematical operation (e.g., `i32.add`) and before a `br` exit instruction.    - **Constraint:** Ensure `unreachable` causes an immediate trap, stopping before `br`.    - **Relation to Infinite Loops:** If `unreachable` doesn't work properly, the loop may infinitely execute ignoring the `br`.    - **Expected Behavior:** Trap should occur due to `unreachable`.

(assert_invalid
  (module (func $test-loop-unreachable
    (loop (i32.const 0) (i32.const 1) (i32.add) (unreachable) (br 1))
  ))
  "type mismatch"
)