;; 4. **Incorrect deep nesting resolution**: Structure multiple deeply nested `if` and `block` instructions, with a `br` instruction within the deepest nest trying to break to a higher-level invalid label, ensuring correct nesting validation is preserved.    ```    (block $outer      (if (i32.const 1)        (block $middle          (block $inner            (else              (block $deepest                (br $invalid_label)              )            )          )        )      )    )    ```

(assert_invalid
  (module
    (func $incorrect-deep-nesting
      (block $outer
        (if (i32.const 1)
          (block $middle
            (block $inner
              (else
                (block $deepest
                  (br $invalid_label)
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)