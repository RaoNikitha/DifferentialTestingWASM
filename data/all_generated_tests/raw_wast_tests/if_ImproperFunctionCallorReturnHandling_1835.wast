;; 6. **Invalid Function Reference in If Block Leading to Type Mismatch**:    - Test Description: Use a function reference in the `if` block that does not match the expected input/output types of the block.    - Relevant Constraint: Validates function reference type constraints within an `if` instruction.    - Improper Handling Scenario: Detect improper type verification in `wizard_engine` due to invalid function references.

(assert_invalid
  (module (func $invalid-func-type-if (result i32)
    (if (result i32) (i32.const 1)
      (then (call $undefined_func) (i32.const 1))
      (else (i32.const 0))
    )
  ))
  "unknown function"
)