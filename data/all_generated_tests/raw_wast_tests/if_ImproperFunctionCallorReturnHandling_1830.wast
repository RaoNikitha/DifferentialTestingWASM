;; 1. **Function Call Within Then Block Type Mismatch**:    - Test Description: Create a scenario where a function call within the `then` block of an `if` statement does not match the block's expected types, triggering validation errors.    - Relevant Constraint: Ensures the function call's stack types align with the expected types of the `then` block.    - Improper Handling Scenario: If `wizard_engine` improperly handles type mismatches within function calls during control flow.

(assert_invalid
  (module (func $function-call-type-mismatch (result i32)
    (if (result i32) (i32.const 1)
      (then (call $dummy_func) (i32.const 1))
      (else (i32.const 1))
    )
    (func $dummy_func (result f32) (f32.const 1.0))
  ))
  "type mismatch"
)