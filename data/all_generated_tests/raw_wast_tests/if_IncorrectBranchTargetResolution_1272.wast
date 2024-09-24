;; 3. **Branch to invalid label in else block**: Write an `if` block with nested `else` part containing a `br` instruction that attempts to branch to an invalid label beyond its scope, which should fail in a correct implementation.    ```    (block      (if (i32.const 0)         (then          (i32.const 42)        )         (else           (block $label_invalid            ;; Operations          )          (br $label_invalid)        )      )    )    ```

(assert_invalid
  (module
    (func $branch_to_invalid_label_in_else (result i32)
      (block
        (if (i32.const 0)
          (then
            (i32.const 42)
          )
          (else
            (block $label_invalid)
            (br $label_invalid)
          )
        )
      )
    )
  )
  "unknown label"
)