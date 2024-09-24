;; 1. Test a simple `if` instruction with a nested `block` where the `if` branch targets the block's label incorrectly.    ```wasm    (block $label1 (if (i32.const 1) (then (br $label1))))    ```

(assert_invalid
  (module
    (func $test
      (block $label1
        (if (i32.const 1)
          (then
            (br $label1)
          )
        )
      )
    )
  )
  "invalid branch target label"
)