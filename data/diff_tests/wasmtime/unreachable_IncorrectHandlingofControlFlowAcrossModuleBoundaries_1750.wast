;; 1. **Test 1: Imported Function Immediately Calls `unreachable`**    - Description: Create a WebAssembly module that imports a function. The imported function body contains only an `unreachable` instruction. Call this imported function from the main module.    - Constraint Checked: Ensures that transitioning from one module to another and immediately encountering `unreachable` correctly triggers a trap without further execution.    - Relation: Tests if the call and return handling correctly propagate the trap when control flows across module boundaries.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func (export "main") (call $externalFunc))
  )
  "unreachable"
)