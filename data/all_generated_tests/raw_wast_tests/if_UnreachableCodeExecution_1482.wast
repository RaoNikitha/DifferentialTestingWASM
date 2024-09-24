;; 3. **Unreachable at End of Then Block**:    Construct a test placing an `unreachable` instruction at the very end of the `then` block. This evaluates if control flow correctly exits at `else` or `end`, avoiding the `unreachable`.    ```    if (i32.const 1) i32.const 1 unreachable else i32.const 2 end    ```

(assert_invalid
  (module (func $test-unreachable-at-end-then (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1) (unreachable)) (else (i32.const 2)))
  ))
  "unreachable"
)