;; 6. **Mismatched input type branch**: Create an `if` block expecting a specific input type. Inside the `else` part, use a `br` instruction that attempts to branch to a label with an incompatible stack type causing a validation error in a correct implementation.    ```    (block $outer      (if (i32.const 0)        (then          (i32.const 10)        )         (else          (i32.const 20)          (br $outer)        )      )    )    ```

(assert_invalid
  (module
    (func $mismatched_input_type_branch
      (block $outer
        (if (result i32)
          (i32.const 0)
          (then
            (i32.const 10)
          )
          (else
            (i32.const 20)
            (br $outer)
          )
        )
      )
    )
  )
  "type mismatch"
)