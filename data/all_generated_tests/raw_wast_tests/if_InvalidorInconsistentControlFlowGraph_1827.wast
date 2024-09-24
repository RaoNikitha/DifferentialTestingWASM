;; 8. **Mismatched Block Type and Output Types**: Utilize `if` instructions where the blocktype does not match the internal result types, ensuring the CFG correctly validates output type relationships.    ```wasm    ;; stack: [i32]    if (result i64)      ;; then branch      i32.const 1    else      ;; else branch      i64.const 2    end    ```

(assert_invalid
  (module
    (func
      (if (result i64)
        (then (i32.const 1))
        (else (i64.const 2))
      )
    )
  )
  "type mismatch"
)