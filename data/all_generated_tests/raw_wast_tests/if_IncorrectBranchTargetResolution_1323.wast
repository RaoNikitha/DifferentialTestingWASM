;; 4. Test an `if` nested within another `if` where the inner `if` branches to the outer `if`'s label.    ```wasm    (if (i32.const 1) (then (if (i32.const 1) (then (br 1)))))    ```

(assert_invalid
  (module (func
    (if (i32.const 1) (then
      (if (i32.const 1) (then
        (br 1)
      ))
    ))
  ))
  "invalid jump target"
)