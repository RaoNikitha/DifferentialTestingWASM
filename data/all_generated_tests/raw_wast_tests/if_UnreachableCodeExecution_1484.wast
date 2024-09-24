;; 5. **Unreachable With Immediate Else**:    Implement an `if` block where the `else` directly follows an `unreachable` in the `then` block. This aims to check the immediate context switch at `else`.    ```    if (i32.const 1) unreachable else i32.const 3 end    ```

(assert_invalid
  (module (func $unreachable-then-else (result i32)
    (if (result i32) (i32.const 1) (then (unreachable) (else (i32.const 3))))
  ))
  "unreachable code in then block"
)