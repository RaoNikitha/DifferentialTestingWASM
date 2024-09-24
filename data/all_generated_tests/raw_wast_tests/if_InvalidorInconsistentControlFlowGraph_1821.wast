;; 2. **Elided Else Block**: Provide an `if` instruction with no `else` block. Verify that the CFG correctly handles the absence of an `else` block, especially ensuring that the whole block still conforms to type expectations.    ```wasm    ;; stack: [i32]    if (result i64)      ;; then branch      i64.const 10    end    ```

(assert_invalid
  (module (func $elided-else-block
    (if (result i64)
      (then (i64.const 10))
    )
  ))
  "type mismatch"
)