;; 10. **Return Before Condition Evaluation and Else Block Execution**:     - Test Description: Include a return instruction just before the `if` condition evaluation and analyze stack changes upon returning from an `else` block.     - Relevant Constraint: Checks the stack state consistency when returns are executed before evaluating `if` with `else` paths.     - Improper Handling Scenario: `wizard_engine` may improperly restore stack states or fail to properly sequence control flow when encountering returns right before conditions.

(assert_invalid
  (module (func $return-before-condition (result i32)
    (return (i32.const 0))
    (if (result i32) (i32.const 1) 
      (then (i32.const 1)) 
      (else (i32.const 2))
    )
  ))
  "return before condition causes stack inconsistency"
)