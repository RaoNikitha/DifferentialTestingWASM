;; 1. **Test Description**:    - **Scenario**: Create a function that expects 2 integer arguments and returns their sum. Call this function with 3 arguments instead of 2.    - **Constraint Checked**: Validate that the function call checks and pops the correct number of arguments from the stack.    - **Unreachable Code Execution**: Excess arguments should lead to a trap before reaching an `unreachable` instruction due to stack mismatch in wizard_engine.    - **Expected Differential Behaviour**: WebAssembly implementation might not explicitly handle the argument mismatch and could potentially proceed, whereas wizard_engine should trigger an arity mismatch trap.

(assert_invalid
  (module
    (func $sum (param i32 i32) (result i32)
      local.get 0
      local.get 1
      i32.add)
    (func $test
      i32.const 1
      i32.const 2
      i32.const 3
      call $sum)
  )
  "type mismatch"
)