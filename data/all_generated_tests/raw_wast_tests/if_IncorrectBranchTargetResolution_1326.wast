;; 7. Test an `if` instruction with `loop` inside `else` block to check jumping to surrounding labels.    ```wasm    (block $label1 (if (i32.const 0) (then (nop)) (else (loop $label2 (br $label1)))))    ```

(assert_invalid
  (module
    (block $label1
      (if (i32.const 0)
        (then (nop))
        (else (loop $label2 (br $label1)))
      )
    )
  )
  "type mismatch"
)