;; 6. Test a complex nesting of `blocks` and `if`s to see if labels resolve correctly across multiple layers.    ```wasm    (block $label1 (block $label2 (if (i32.const 1) (then (br $label1)))))    ```

(assert_invalid
  (module
    (func $complex-nested-labels
      (block $label1
        (block $label2
          (if (i32.const 1)
            (then
              (br $label1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)