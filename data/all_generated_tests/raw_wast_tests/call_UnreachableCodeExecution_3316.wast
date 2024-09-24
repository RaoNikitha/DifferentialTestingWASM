;; 5. **Test Description**:    - **Scenario**: Implement a function loop where a specific condition leads to calling an external function followed by `unreachable`.    - **Constraint Checked**: Stack state management and call frame preservation.    - **Unreachable Code Execution**: Bugs in preserving call frames might allow the `unreachable` instruction to execute erroneously.    - **Expected Differential Behaviour**: wizard_engine should trap on call frame mismanagement, while WebAssembly could mishandle and reach `unreachable`.

(assert_invalid
  (module
    (func $external (import "env" "external_func") (param i32))
    (func (param i32)
      (local i32)
      (loop
        (local.set 0 (i32.const 1))
        (call $external (local.get 0))
        unreachable
      )
    )
  )
  "unreachable must not be reached"
)