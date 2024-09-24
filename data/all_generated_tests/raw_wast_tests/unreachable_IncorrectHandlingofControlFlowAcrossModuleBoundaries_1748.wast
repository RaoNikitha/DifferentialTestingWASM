;; 9. **Handler Function to Catch Trap from Module with Unreachable Instruction:**    - Implement a handler function in one module designed to catch traps. Call an imported function with an `unreachable` from this module and ensure that the trap is accurately caught and handled.    - **Constraint:** Validate cross-module error handling ensuring traps from `unreachable` are captured properly by handlers in different modules.

(assert_invalid
  (module
    (func $handler_fn
      (block (call $unreachable_fn))
      (drop)
    )
    (func $unreachable_fn (unreachable))
    (import "env" "handler_fn" (func $handler_fn))
  )
  "trap expected"
)