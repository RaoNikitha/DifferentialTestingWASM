;; 6. **Test Description**:    - **Scenario**: Construct a function with a variable argument count and follow it with `unreachable`.    - **Constraint Checked**: Proper stack argument handling of variable argument functions.    - **Unreachable Code Execution**: Inconsistent argument handling may lead to `unreachable` being executed.    - **Expected Differential Behaviour**: wizard_engine will trap on variable argument mismanagement, while WebAssembly might allow reaching the `unreachable`.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (func $variable-args
      (call $variable-args (i32.const 1) (i32.const 2) (unreachable)))
  )
  "type mismatch"
)