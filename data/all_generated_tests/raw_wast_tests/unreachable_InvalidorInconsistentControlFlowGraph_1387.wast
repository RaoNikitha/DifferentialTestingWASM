;; 8. **Test: `unreachable` with Dead Code**    - **Goal:** Evaluate CFG accuracy regarding dead code following `unreachable`.    - **Description:** Design a test where dead code segments follow an `unreachable` statement. Check if the dead code is correctly identified and not executed, confirming the CFG correctly handles unused code paths.    - **Constraint Checked:** CFG resolution of dead code post-`unreachable`.

(assert_invalid
  (module (func $unreachable-dead-code 
    (unreachable) 
    (i32.const 1) 
    (i32.add (i32.const 2) (i32.const 3))
  ))
  "unreachable code after trap"
)