;; 2. **Exported Function Returning to Module with `unreachable`:**    - Create a module that exports a function containing the `unreachable` instruction. Another module calls this exported function and attempts to continue execution after the call.    - **Constraint:** Validates that the `unreachable` instruction in the called module triggers an immediate trap and does not return control to the caller module.

(assert_invalid
  (module
    (import "env" "called_func" (func $called_func))
    (func (export "caller_func")
      (call $called_func)
      (i32.const 42)
      (drop)
    )
  )
  "invalid import"
)
(assert_invalid
  (module
    (func (export "called_func")
      (unreachable)
    )
  )
  "invalid function"
)