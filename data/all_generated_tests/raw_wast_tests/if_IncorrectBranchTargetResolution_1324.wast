;; 5. Test an `if` instruction where the condition evaluates to false but attempts to branch in the `else` to an incorrect target.    ```wasm    (block $label1 (if (i32.const 0) (then (nop)) (else (br $label1))))    ```

(assert_invalid
  (module
    (block $label1
      (if (i32.const 0)
        (then (nop))
        (else (br $label1))
      )
    )
  )
  "invalid branch target"
)