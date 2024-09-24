;; 6. **Stack Management Mismatch**: Create an `if` instruction where stack operations mismatch between branches, leading to improper stack heights. This checks if CFG validation ensures the operand stack correctly maintains conformity.    ```wasm    (block $label1 (result i32)      ;; stack: [i32]      if (result i32)        ;; then branch        drop ;; removes the i32, making stack empty during validation      else        ;; else branch        i32.const 4      end    )    ```

(assert_invalid
  (module
    (func $stack-mismatch-if-drop (result i32)
      (block $label1 (result i32)
        (i32.const 1)
        if (result i32)
          drop
        else
          i32.const 4
        end
      )
    )
  )
  "type mismatch"
)