;; 4. **Test Description**:    - **Scenario**: Design a function that calls another function with mismatched return types and follow it with an `unreachable` instruction.    - **Constraint Checked**: Type consistency of return values during function calls.    - **Unreachable Code Execution**: Incorrect type handling might cause control to reach an `unreachable` instruction erroneously.    - **Expected Differential Behaviour**: wizard_engine will trap on type mismatch in return values and prevent reaching `unreachable`, whereas WebAssembly might fail in catching this inconsistency immediately.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $called_func (result i32) (i32.const 42))
    (func $caller_func
      (call $called_func)
      (drop)
      (unreachable)
    )
  )
  "type mismatch"
)