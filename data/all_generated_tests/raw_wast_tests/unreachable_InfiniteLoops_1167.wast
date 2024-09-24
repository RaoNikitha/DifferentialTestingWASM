;; 8. **Test Description:**     - A loop where an `i32.const` is pushed followed by an `unreachable` before a `br_if` that occasionally exits the loop.    - **Constraint:** Verify that `unreachable` within the loop causes immediate trap regardless of constants.    - **Relation to Infinite Loops:** Failure in handling `unreachable` may allow loop continuation indefinitely.    - **Expected Behavior:** Trap should occur due to `unreachable`.

(assert_invalid
  (module
    (func $test-loop-unreachable
      (loop
        (i32.const 1)
        (unreachable)
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)