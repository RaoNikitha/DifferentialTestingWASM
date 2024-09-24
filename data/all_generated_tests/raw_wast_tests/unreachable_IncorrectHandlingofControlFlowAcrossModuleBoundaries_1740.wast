;; 1. **Test Call to Imported Function with Post-Unreachable Instruction:**    - In the calling module, place an `unreachable` instruction right after a function `call` to an imported function. Check if both implementations correctly trap without executing any further instructions from the caller.    - **Constraint:** Validate if the `unreachable` instruction following an imported function call causes an immediate trap, ensuring the called module's scope doesn't affect the trap in the caller module.

(assert_invalid
  (module 
    (import "env" "externalFunction" (func $externalFunction))
    (func (call $externalFunction) (unreachable) (i32.const 1))
  )
  "type mismatch"
)