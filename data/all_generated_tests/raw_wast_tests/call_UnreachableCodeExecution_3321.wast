;; 10. **Test Description**:     - **Scenario**: Use an imported function with improper validation followed by `unreachable`.     - **Constraint Checked**: Validation of imported functions before invocation.     - **Unreachable Code Execution**: Improper function imports might allow control to reach an `unreachable` instruction.     - **Expected Differential Behaviour**: wizard_engine should trap during function import validation, preventing `unreachable`, while WebAssembly might reach `unreachable`.

(assert_invalid
  (module
    (import "env" "invalidFunc" (func (param i32)))
    (func $test (call 0 (i32.const 5)) unreachable)
  )
  "unreachable executed"
)