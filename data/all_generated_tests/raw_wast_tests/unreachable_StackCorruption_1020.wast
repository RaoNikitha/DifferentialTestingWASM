;; 1. **Test 1: Nested `unreachable` within a Block**    - Test involves placing an `unreachable` instruction inside a `block` that includes multiple instructions.    - This tests whether the stack is correctly managed after the trap initiated by `unreachable`.    - Checking whether both implementations correctly handle stack cleanup post-trap without stack corruption.

(assert_invalid
  (module (func $nested-unreachable-within-block (result i32)
    (block (result i32)
      (unreachable)
      (i32.const 1)
      (i32.add)
    )
  ))
  "type mismatch"
)