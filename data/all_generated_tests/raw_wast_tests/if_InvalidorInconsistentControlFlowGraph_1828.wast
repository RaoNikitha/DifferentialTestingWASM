;; 9. **Incorrect End Instruction**: Implement an `if` within other structured control blocks (e.g., `loop`) and intentionally mismatch the `end` instruction to test CFG’s ability to identify nested block termination errors.    ```wasm    (loop $label2      ;; stack: [i32]       if (result i32)        ;; then branch        i32.const 1      else        ;; else branch        i32.const 2      end ;; improper ending      br $label2    )    ```

(assert_invalid
  (module
    (func
      (loop $label2
        if (result i32)
          i32.const 1
        else
          i32.const 2
        end
        br $label2
      )
    )
  )
  "mismatched end instruction"
)