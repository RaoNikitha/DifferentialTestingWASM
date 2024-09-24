;; 1. **Test Description**: Create a test with a sequence of `nop` instructions within a function that calls an imported function. Ensure that the stack remains unchanged before and after the call.    - **Constraint**: Validate that `nop` does not affect the stack or control flow.    - **Relates to**: Ensures `nop` does not corrupt the stack when transitioning control between modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func
      nop
      nop
      call $external_func
      nop
      nop
    )
  )
  "type mismatch"
)