;; 2. Test an `if` instruction with both `then` and `else` branches containing differing label targets, to see if the implementation maintains correct label context.    ```wasm    (block $label1 (if (i32.const 1) (then (br $label1)) (else (br $label1))))    ```

(assert_invalid
  (module
    (func $label-targets
      (block $label1
        (if (i32.const 1)
          (then (br $label1))
          (else (br $label1))
        )
      )
    )
  )
  "type mismatch"
)