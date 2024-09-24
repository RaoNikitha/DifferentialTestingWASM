;; 4. **Test Description:**     - Create a nested loop setup where the inner loop contains an `unreachable` before a `br_if` that should exit to the outer loop.    - **Constraint:** Confirm that `unreachable` within the inner loop triggers a trap.    - **Relation to Infinite Loops:** Incorrect handling of `unreachable` may cause infinite looping in both inner and outer loops if `br_if` fails.    - **Expected Behavior:** Trap should occur due to `unreachable`.

(assert_invalid
  (module (func $test-nested-loop-with-unreachable
    (loop (loop (unreachable) (br_if 0 (i32.const 0))))
  ))
  "unreachable instruction must trap"
)