;; 5. **Test Description:**     - Define a loop with a `br_if` intended to exit on a true condition, but the loop also includes an `unreachable` for a specific path.    - **Constraint:** Verify immediate trap execution when `unreachable` path is taken.    - **Relation to Infinite Loops:** Mismanaged conditional branching and `unreachable` may cause unintended infinite looping.    - **Expected Behavior:** Trap should occur due to `unreachable`.

(assert_invalid
  (module (func $unreachable-loop-br_if
    (loop (br_if 1 (i32.const 1)) (unreachable))
  ))
  "unreachable must cause an immediate trap"
)