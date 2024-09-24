;; 6. **Test trapping with `unreachable` in deeply nested blocks:**    - Intersperse multiple nested block levels with an `unreachable` at the deepest level.    - **Constraint:** Ensures the control flow deeply nested within blocks triggers accurate traps.    - **Related to**: Evaluates how well nested executions handle immediate code paths.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (block
            (block
              (unreachable)
            )
          )
        )
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)