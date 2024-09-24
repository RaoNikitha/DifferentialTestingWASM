;; 6. **`unreachable` in a Recursive Call:**    - **Description:** Test a recursive function that leads to an `unreachable` instruction to check for proper stack frame termination on trap.    - **Constraint:** Each recursive call must maintain stack state up to the trap.    - **Relation to Stack Corruption:** Verifies recursive stack frame cleanup.

(assert_invalid
  (module
    (func $recursive-unreachable (result i32)
      (block $label (result i32)
        (call $recursive-unreachable)
        (unreachable)
      )
    )
    (func $main 
      (call $recursive-unreachable)
    )
  )
  "unreachable must cause trap"
)