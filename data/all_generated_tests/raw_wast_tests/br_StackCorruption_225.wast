;; 6. **Test Unreachable Br Across Blocks:**    - **Description:** Create a scenario where `br` is executed in an unreachable code path spanning multiple block levels.    - **Reasoning:** Checks robust handling of unreachable branches within the stack and control context.    - **Constraint:** Confirm branches in unreachable code maintain stack consistency.    - **Relation to Stack Corruption:** Unrealistic branches should leave the stack unaffected, but improper handling may cause silent corruption.

(assert_invalid
  (module
    (func
      (block
        (block
          (unreachable)
          (br 1)
        )
      )
    )
  )
  "unreachable code"
)