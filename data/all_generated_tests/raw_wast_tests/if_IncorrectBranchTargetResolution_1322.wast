;; 3. Test a deeply nested `if` inside a `loop`, checking incorrect label resolution within nested control flow structures.    ```wasm    (loop $label1 (if (i32.const 1) (then (br $label1))))    ```

(assert_invalid
  (module
    (func (loop $label1 (if (result i32) (i32.const 1) (then (br $label1)))))
  )
  "type mismatch"
)