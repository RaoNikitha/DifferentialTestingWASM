;; 10. Test an erroneous scenario where both `then` and `else` branches attempt to jump to a non-existent outer label.    ```wasm    (block $label1 (if (i32.const 1) (then (br 1)) (else (br 2))))    ```

(assert_invalid
  (module
    (block $label1 (if (i32.const 1) (then (br 1)) (else (br 2))))
  )
  "unknown label"
)