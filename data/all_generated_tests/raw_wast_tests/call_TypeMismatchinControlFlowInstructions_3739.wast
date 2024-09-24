;; 8. **Inline Function Call Type Discrepancy in Conditionals**:    - **Description**: Conduct inline function calls within conditional expressions mismatching the expected argument types.    - **Reasoning**: Tests the robustness of type checking within inline conditional function calls.    - **Constraint**: Errors should emerge from type inconsistencies in conditional call argument types.    - **Relation**: Confirms type robustness in inline function calls within conditionals.

(assert_invalid
  (module
    (func $inline-cond-type-mismatch
      (if (i32.const 1) 
        (then (call 1 (i32.const 0))))
    )
    (func (param f32))
  )
  "type mismatch"
)