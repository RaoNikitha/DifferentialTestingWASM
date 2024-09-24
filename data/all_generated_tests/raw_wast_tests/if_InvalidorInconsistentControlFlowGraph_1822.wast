;; 3. **Unreachable Instructions**: Include unreachable instructions within the `if` block to check that the CFG accurately tracks which instructions should be considered executable.    ```wasm    ;; stack: [i32]    if (result i32)      ;; then branch      unreachable    else      ;; else branch      i32.const 5    end    ```

(assert_invalid
  (module (func $unreachable-in-if (param i32) (result i32)
    (if (result i32) (local.get 0)
      (then unreachable)
      (else i32.const 5)
    )
  ))
  "type mismatch"
)