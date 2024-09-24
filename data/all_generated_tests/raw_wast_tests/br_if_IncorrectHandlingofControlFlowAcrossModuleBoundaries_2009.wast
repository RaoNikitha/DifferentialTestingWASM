;; 10. **Test Description**:    - **Scenario**: Use a `br_if` inside an exported function's loop, which loops back to the start conditionally based on an imported module call.    - **Constraint**: Validate that loop’s operand stack integrity is maintained during the conditional back-jump.    - **Differential Focus**: Highlight discrepancies in how loop inputs are managed between the two implementations, especially across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (export "test_func")
      (loop (result i32)
        (br_if 0 (call $external_func))
      )
    )
  )
  "type mismatch"
)