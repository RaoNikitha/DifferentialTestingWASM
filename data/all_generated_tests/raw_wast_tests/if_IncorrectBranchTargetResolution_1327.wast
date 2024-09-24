;; 8. Test an `if` instruction defined within a `block`, followed by another `block` to ensure correct label stack management.    ```wasm    (block $label1 (if (i32.const 1) (then (block $label2 (br $label1)))))    ```

(assert_invalid
  (module
    (func $test
      (block $label1
        (if (i32.const 1)
          (then
            (block $label2
              (br $label1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)