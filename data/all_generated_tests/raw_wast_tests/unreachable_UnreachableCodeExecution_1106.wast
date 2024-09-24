;; 7. **Test Description:**    - **Scenario:** Have `unreachable` after a sequence of valid operations ending with `return`, which shouldn't execute the `unreachable`.    - **Constraint Checked:** Checks that `return` operations prevent reaching `unreachable`.    - **Relation to Unreachable Code Execution:** Verifies that effective returns avoid the trap despite the presence of `unreachable`.

(assert_invalid
  (module (func $test-return-before-unreachable (result i32)
    (return (i32.const 0)) (unreachable)
  ))
  "type mismatch"
)