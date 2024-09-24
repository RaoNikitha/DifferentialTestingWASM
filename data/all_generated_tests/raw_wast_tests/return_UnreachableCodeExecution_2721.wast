;; 10. **Test Scenario**: Create a function that returns in a switch-case construct, with an unreachable instruction placed in the default case.    **Constraint**: Confirm proper exit from switch-cases on return and correct default handling.    **Unreachable Code**: Identify if return logic in default case is mishandled leading to unreachable execution.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (br_table 0 0 0 (i32.const 0))
        (return (i32.const 1))
        (unreachable)
      )
    )
  )
  "type mismatch"
)