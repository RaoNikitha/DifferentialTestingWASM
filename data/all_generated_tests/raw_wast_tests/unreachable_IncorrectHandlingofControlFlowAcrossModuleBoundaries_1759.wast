;; 10. **Test 10: Simulated Stack Overflows with `unreachable` in Deep Nested Calls Across Modules**     - Description: Create a scenario with deep nested function calls between multiple modules ending in an `unreachable` within the deepest call. Verify if a trap is correctly and deterministically handled.     - Constraint Checked: Makes sure that deep nested calls through multiple modules appropriately handle and propagate stack overflows induced by `unreachable`.     - Relation: Checks how deeply nested control flows and traps operate when reaching instruction limits across boundaries.

(assert_invalid
  (module
    (import "mod" "func" (func $nested_call1))
    (func $nested_call2 (call $nested_call1) unreachable)
  )
  "type mismatch"
)

(assert_invalid
  (module
    (import "mod" "func" (func $nested_call2))
    (func $nested_call1 (call $nested_call2) unreachable)
  )
  "type mismatch"
)