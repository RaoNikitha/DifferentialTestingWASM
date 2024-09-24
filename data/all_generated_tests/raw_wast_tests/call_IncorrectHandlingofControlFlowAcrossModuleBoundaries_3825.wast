;; 4. **Nested Function Calls Across Modules**:    - **Description**: Perform nested function calls where functions from multiple modules are invoked in sequence and validate that the stack returns to the correct state after each call.    - **Constraint**: Context must preserve stack state through nested calls.    - **Relation**: Ensures nested calls across modules do not corrupt the stack.

(assert_invalid
  (module
    (import "mod_a" "func_a" (func (result i32)))
    (import "mod_b" "func_b" (func (param i32) (result i32)))
    (func $nested_call_test (result i32)
      (i32.const 5)
      (call 1)
      (call 0)
    )
  )
  "function type mismatch"
)