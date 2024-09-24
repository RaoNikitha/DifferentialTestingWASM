;; 5. **Function Call Sequence in Then Block Leading to Unreachable**:    - Test Description: Chain multiple function calls within the `then` block of an `if` statement and end with an `unreachable` instruction.    - Relevant Constraint: Ensures correct call stack cleanup and function type consistency leading up to a trap.    - Improper Handling Scenario: Mismanagement of call sequences or improperly handling stack states leading to an `unreachable` trap in `wizard_engine`.

(assert_invalid
  (module (func $func-call-sequence-in-then
    (if (result i32) (i32.const 1)
      (then 
        (call $undefined_func)
        (call $undefined_func)
        (unreachable)
      )
    (else 
      (i32.const 0)
    ))
  ))
)