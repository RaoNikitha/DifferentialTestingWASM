;; 3. **Return From Function Within Nested If Condition**:    - Test Description: Place a return instruction inside a function that is itself nested within an `if` block, ensuring that the return type is enforced.    - Relevant Constraint: Properly determines the stack type upon returning from a function call within nested control flow.    - Improper Handling Scenario: Incorrect handling in `wizard_engine` might lead to stack inconsistencies or improper cleanup.

(assert_invalid
  (module
    (func $nested-if-return
      (result i32)
      (if (i32.const 1)
        (then (if (i32.const 1) (then (return (i32.const 42))))) 
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)