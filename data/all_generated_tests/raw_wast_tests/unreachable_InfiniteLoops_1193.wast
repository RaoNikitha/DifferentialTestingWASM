;; 4. **Test 4:** Check the behavior of `unreachable` in a loop with a guaranteed infinite condition (e.g., `br_if` always true).    - **Constraint:** Verify that despite the indefinite condition, `unreachable` successfully traps.    - **Relation to Infinite Loops:** Confirms that properly handling traps can prevent explicit infinite loops by immediate execution of `unreachable`.

(assert_invalid
  (module (func $loop-unreachable (loop (br_if 0 (i32.const 1)) unreachable))
  "type mismatch"
)