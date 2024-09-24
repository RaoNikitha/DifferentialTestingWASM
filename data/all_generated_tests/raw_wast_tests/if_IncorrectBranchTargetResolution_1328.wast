;; 9. Test a multi-level `if` within a `loop` and ensure the correct label target within nested branching.    ```wasm    (loop $label1 (block $label2 (if (i32.const 1) (then (if (i32.const 1) (then (br $label1)))))))    ```

(assert_invalid
  (module 
    (func $multi-level-if-within-loop (loop $label1 (block $label2 
      (if (result i32) (i32.const 1) 
        (then (if (result i32) (i32.const -1) (then (br $label1))))
        (else (nop))
      )
    )))
  )
  "type mismatch due to else branch stack height"
)