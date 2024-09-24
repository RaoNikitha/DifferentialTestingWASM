;; 10. **Multiple Operands on Stack**: Form an `if` instruction where both branches manipulate the stack in incompatible ways, to ensure that the CFG records and verifies stack consistency over executions.    ```wasm    ;; stack: [i32, i32]    if (result i32)      ;; then branch      i32.add ;; consume two i32, push result    else      ;; else branch      i32.const 2      i32.mul ;; erroneous extra stack handling    end    ```

(assert_invalid
  (module
    (func $multiple-operands-on-stack (result i32)
      (i32.const 1) (i32.const 2)
      (if (result i32)
        (then (i32.add))
        (else (i32.const 2) (i32.mul))
      )
    )
  )
  "type mismatch"
)