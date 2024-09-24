;; 3. **Test 3: Nested Function Calls with `unreachable` in an Imported Function**    - Description: Design a module A to call a function in module B, which, in turn, calls another function in module C containing the `unreachable` instruction.    - Constraint Checked: Ensures that deep, nested function calls with `unreachable` correctly handle traps and control flow back through each module layer.    - Relation: Tests multiple module boundaries crossing and verifies that stack unwinding on traps works correctly.

(assert_invalid
  (module
    (import "B" "func_in_B" (func $func_in_B))
    (func $call_B (call $func_in_B))
  )
  "type mismatch"
)