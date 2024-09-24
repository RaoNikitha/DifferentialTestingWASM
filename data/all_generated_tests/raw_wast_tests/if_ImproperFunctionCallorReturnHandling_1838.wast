;; 9. **Chain of Function Calls with Type Constraints in If-Else Blocks**:    - Test Description: Sequence several function calls in both `then` and `else` blocks with specific type constraints, ensuring each call maintains stack integrity.    - Relevant Constraint: Ensures each function call within `if-else` blocks adhere to type constraints and stack changes.    - Improper Handling Scenario: Incorrect stack management or type constraint handling by `wizard_engine` when chaining multiple calls.

(assert_invalid
  (module (func $chain-of-function-calls-with-type-constraints (param i32) (result i32)
    (if (result i32) (i32.const 1)
      (then
        (call $funcA (local.get 0))
        (call $funcB)
        (call $funcC)
      )
      (else
        (call $funcD (local.get 0))
        (call $funcE)
        (call $funcF)
      )
    )
  ))
  "type mismatch"
)