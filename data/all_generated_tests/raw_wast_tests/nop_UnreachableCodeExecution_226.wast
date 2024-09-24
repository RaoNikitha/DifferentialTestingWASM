;; 7. **Test Case 7: `nop` inside a nested block structure, ending in `unreachable`:**    - **Constraint Checked:** Validating `nop`’s non-interfering nature inside nested blocks.    - **Expected Behavior:** Execution should follow block structure and hit `unreachable`, causing a trap.    - **Differential Behavior:** Wizard_engine might mishandle nested contexts due to improper initialization.

(assert_invalid
  (module
    (func
      (block $outer
        (block $inner
          (nop)
          (unreachable)
        )
      )
    )
  )
  "unreachable executed"
)