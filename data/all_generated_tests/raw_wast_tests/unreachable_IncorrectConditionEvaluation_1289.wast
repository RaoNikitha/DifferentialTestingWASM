;; - **Test 10: Tuple of Unreachable Instructions with Mixed True/False Conditions**   ```   Compose a function with multiple `br_if` conditions, some leading to `unreachable`. Ensure false conditions should reach the trap without incorrectly satisfying true branches. Incorrect evaluations manifest as surplus or missing traps, indicating differential behavior.   ```

(assert_invalid
  (module
    (func
      unreachable
      (br_if 0 (i32.const 1))
      (br_if 1 (i32.const 0))
      unreachable
    )
  )
  "type mismatch"
)