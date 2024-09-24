;; 3. **Test: `unreachable` After Conditional Branch**    - **Goal:** Verify CFG correctness when `unreachable` follows a conditional branch.    - **Description:** Implement a conditional branching structure where each branch ends with `unreachable`. Check if the CFG appropriately causes a trap regardless of which branch is taken and ensures no code after the conditional is executed.    - **Constraint Checked:** CFG correctness for conditionals followed by `unreachable`.

(assert_invalid
 (module
  (func $conditional-unreachable
   (if (i32.const 1)
    (then (unreachable))
    (else (unreachable))
   )
   (i32.const 0)
  )
 )
 "type mismatch"
)