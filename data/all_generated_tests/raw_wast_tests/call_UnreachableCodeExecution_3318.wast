;; 7. **Test Description**:    - **Scenario**: Place an `unreachable` instruction immediately after a function call that manipulates globals and had an off-by-one error handling argument.    - **Constraint Checked**: Ensuring globals involved in function calls are handled correctly.    - **Unreachable Code Execution**: Mismanaged globals might cause the control to incorrectly fall to `unreachable`.    - **Expected Differential Behaviour**: wizard_engine will detect and trap on global mismanagement, preventing `unreachable`, whereas WebAssembly might reach `unreachable`.

(assert_invalid
  (module
    (global $glob (mut i32) (i32.const 0))
    (func $incorrect-global-update
      (i32.const 10)
      (global.set $glob)
      (global.set $glob) ; off-by-one error, setting global again
      (call $f)
      unreachable
    )
    (func $f (param i32))
  )
  "global mismanagement"
)