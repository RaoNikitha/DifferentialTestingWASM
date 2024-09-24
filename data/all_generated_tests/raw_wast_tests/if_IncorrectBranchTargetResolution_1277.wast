;; 8. **Direct branch to middle block test**: Create a nested `if` statement where the `else` part contains instructions that incorrectly branch to a label inside another block nested within the same `else` part which should not be accessible.    ```    (block      (if (i32.const 0)        (then          (i32.const 12)        )        (else          (block $middle            (block $inner              (br $middle)            )          )        )      )    )    ```

(assert_invalid
  (module
    (func
      (block
        (if (result i32) (i32.const 0)
          (then (i32.const 12))
          (else
            (block $middle
              (block $inner
                (br $middle)
              )
            )
          )
        )
      )
    )
  )
  "invalid branch"
)