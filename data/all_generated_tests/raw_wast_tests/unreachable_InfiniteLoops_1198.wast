;; 9. **Test 9:** Design a loop that conditionally ends with `br_if` and place `unreachable` immediately after to ensure not looping again.    - **Constraint:** Test conditional exits ensuring they correctly evaluate prior to hitting `unreachable`.    - **Relation to Infinite Loops:** Prevents infinite loops by validating the exit condition before `unreachable` correctly triggers.

(assert_invalid
  (module (func $test_cond_loop_unreachable
    (loop (result i32)
      (br_if 1 (i32.const 0))
      (unreachable)
    )
  ))
  "type mismatch"
)