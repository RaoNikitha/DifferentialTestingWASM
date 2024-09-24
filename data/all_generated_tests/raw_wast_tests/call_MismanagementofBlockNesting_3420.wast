;; 9. **Nested Function Calls with Parameter Mismatch**:    - **Description**: Construct nested blocks where function calls expect parameters that mismatch the stack due to incorrect prior block transitions.    - **Constraint**: Ensure parameter type mismatches are properly caught within the nested context, forcing traps or correct flows.    - **Relation to Mismanagement of Block Nesting**: Tests that parameter handling is robust within nested calls, catching mismatches within the correct block scope.

(assert_invalid
  (module
    (func $nested-params-mismatch
      (block
        (block
          (call 0)
        )
      )
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)