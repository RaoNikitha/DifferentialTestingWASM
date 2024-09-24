;; 1. **Unreachable Inside Then Block**:    Create a test where the `then` block contains an `unreachable` instruction followed by normal instructions. This will check if the control flow accurately prevents reaching the `unreachable` when the `if` condition evaluates false.    ```    if (i32.const 0) i32.const 1 unreachable i32.const 2 end    ```

(assert_invalid
  (module (func $unreachable-inside-then-block
    (if (i32.const 0)
      (then (i32.const 1) (unreachable) (i32.const 2))
    )
  ))
  "type mismatch"
)