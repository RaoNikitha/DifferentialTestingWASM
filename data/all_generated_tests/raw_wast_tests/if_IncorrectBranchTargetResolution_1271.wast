;; 2. **Cross-function branching**: Design an `if` statement within a main function that improperly attempts to branch to a label defined within another function using the `br` instruction. The branch target label should be invalid within the current execution context in correct implementations.    ```    (func $another_func       (block $external_label        ;; Some operations      )    )        (func $main      (if (i32.const 1)         (block          (br $external_label)        )      )    )    ```

(assert_invalid
  (module
    (func $another_func
      (block $external_label)
    )
    (func $main
      (if (i32.const 1)
        (block
          (br $external_label)
        )
      )
    )
  )
  "invalid label"
)