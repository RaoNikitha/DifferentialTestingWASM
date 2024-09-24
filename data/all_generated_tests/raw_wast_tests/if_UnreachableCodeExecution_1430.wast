;; 1. Test an `if` instruction with an unreachable instruction in the `then` block:    ```    if (i32.const 1)       unreachable     end    ```    This checks if the implementation correctly traps when the `unreachable` code in the `then` block is reached due to a true condition.

(assert_invalid
  (module (func $unreachable-in-then
    (if (i32.const 1) (then unreachable))
  ))
  "unreachable"
)