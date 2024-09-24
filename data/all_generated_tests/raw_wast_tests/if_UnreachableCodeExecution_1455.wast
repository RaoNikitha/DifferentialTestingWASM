;; 6. **Branch Targeting Unreachable within `else`**:    - Execute a branch targeting an `unreachable` instruction specifically within an `else` block. This checks the integrity of branches handling within multi-level nesting and their interaction with unreachable.    - **Constraint**: Confirms enforced structured control flow and proper branching within nested conditions.

(assert_invalid
  (module
    (func $branch-target-unreachable-in-else
      (block
        (if (i32.const 0)
          (then (nop))
          (else
            (unreachable)
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)