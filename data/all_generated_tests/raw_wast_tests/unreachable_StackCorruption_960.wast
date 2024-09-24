;; 1. **Test Description:**    - **Scenario:** Execute an `unreachable` instruction immediately after a function call that manipulates the stack, without consuming the return value.    - **Specific Constraint Checked:** Verifies if the `unreachable` instruction consistently triggers a trap after the call, regardless of unaddressed stack manipulations.    - **Relation to Stack Corruption:** Ensures that stack management during function returns is not disrupted by `unreachable`.

(assert_invalid
  (module (func $diff_test
    (call $dummy_func) 
    (unreachable)
  ) (func $dummy_func (result i32) (i32.const 42)))
  "unreachable code executed"
)