;; 1. **Unreachable After Return Check**:    - Test that calls the `return` instruction followed by an `unreachable` instruction. Check if the control flow stops before reaching `unreachable`.    - This tests if `return` properly unwinds the stack and exits the function before hitting the `unreachable` instruction.

(assert_invalid
  (module
    (func $unreachable-after-return (result i32)
      (return (i32.const 0))
      unreachable
    )
  )
  "type mismatch"
)