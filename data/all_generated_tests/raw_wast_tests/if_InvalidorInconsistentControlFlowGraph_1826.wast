;; 7. **Unused Labels**: Implement an `if` instruction without properly using its implicit labels, to check if the CFG correctly tracks and validates branching targets.    ```wasm    ;; stack: [i32]    if (result i32)      ;; then branch      br_if 0 (i32.const 5) ;; abnormal branch without label usage    else      ;; else branch      i32.const 4    end    ```

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (result i32)
        (br_if 0 (i32.const 5))
        (else
          (i32.const 4)
        )
      )
    )
  )
  "type mismatch"
)