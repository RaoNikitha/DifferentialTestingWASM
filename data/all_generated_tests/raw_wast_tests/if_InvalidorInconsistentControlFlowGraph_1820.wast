;; 1. **Mismatched Types in Else Branch**: Create an `if` instruction where the `then` branch outputs a different type than the `else` branch. This tests whether the CFG correctly enforces type consistency between branches.    ```wasm    ;; stack: [i32]    if (result f64)      ;; then branch      f64.const 1.0    else      ;; else branch      i32.const 1    end    ```

(assert_invalid
  (module
    (func $mismatched-types-in-if
      (if (result f64)
        (then (f64.const 1.0))
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)