;; 3. **Test Unreachable in Loop with Early Exit:**    - Insert an `unreachable` within a loop but ensure there's a valid early exit condition before the `unreachable` is reached. Verify that the loop can exit cleanly.    - **Constraint Checked:** Confirming control flow allows for early exits from loops containing `unreachable`.    - **CFG Relation:** Improper CFG interpretation might incorrectly propagate the trap behavior to the loop's control flow, disregarding conditions for an early exit.

(assert_invalid
  (module (func $test_unreachable_in_loop_with_early_exit
    (block (loop (br_if 1 (i32.const 1)) (unreachable)))
  ))
  "type mismatch"
)