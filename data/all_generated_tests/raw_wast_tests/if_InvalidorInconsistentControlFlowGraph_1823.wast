;; 4. **Forward Branches in If**: Use branch instructions (e.g., `br`) within the `if` block to ensure CFG can handle forward branches correctly.    ```wasm    (block $label0 (result i32)      ;; stack: [i32]      if (result i32)        ;; then branch        br $label0 (i32.const 1)      else        ;; else branch        i32.const 2      end    )    ```

(assert_invalid
  (module
    (func (result i32)
      (block $label0 (result i32)
        if (result i32)
          br $label0 (i32.const 1)
        else
          i32.const 2
        end
      )
    )
  )
  "type mismatch"
)