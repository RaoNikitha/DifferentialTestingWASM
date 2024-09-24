;; 5. **Incorrect Nesting**: Nest `if` instructions improperly to validate that the CFG detects deeply nested control structures' misalignment.    ```wasm    ;; stack: [i32]    if (result i32)      ;; then branch      i32.const 1      if (result f64)        ;; nested if with wrong type        f64.const 2.0      else        i32.const 2      end    else      ;; else branch      i32.const 3    end    ```

(assert_invalid
  (module
    (func $incorrect-nesting (result i32)
      (i32.const 0)
      if (result i32)
        i32.const 1
        if (result f64)
          f64.const 2.0
        else
          i32.const 2
        end
      else
        i32.const 3
      end
    )
  )
  "type mismatch"
)