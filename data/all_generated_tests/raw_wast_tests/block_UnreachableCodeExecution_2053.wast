;; 4. **Test 4: Multiple Blocks with Mixed Reachable and Unreachable Code**    - **Description**: Create multiple sequential blocks, with some containing standard code and others containing only `unreachable`. Validate that the control flow correctly navigates around unreachables.    - **Constraint**: Ensures proper differentiation of reachable and unreachable code among sequential block structures.

(assert_invalid
  (module (func $multiple-blocks-mixed (result i32)
    (block (result i32)
      (block (result i32)
        (unreachable) 
      )
      (i32.const 1) 
    )
    (i32.const 2)
  ))
  "type mismatch"
)