;; 1. **Test Unreachable in `then` Block Without Reset**:    - Create an `if` instruction with an `unreachable` instruction in the `then` block and no `else` block. Check if the control erroneously reaches the `unreachable` instruction due to lack of state reset.

(assert_invalid
  (module
    (func $unreachable-in-then
      (if (result i32)
        (i32.const 1)
        (then 
          unreachable
        )
      )
    )
  )
  "type mismatch"
)