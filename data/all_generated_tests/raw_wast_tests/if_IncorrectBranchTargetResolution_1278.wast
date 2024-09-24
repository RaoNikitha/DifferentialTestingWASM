;; 9. **Illegal discontiguous branch target test**: Implement an `if` statement with an `else` block that contains a jump to a label defined outside its valid scope range, ensuring only valid branch targets are resolvable.    ```    (block $outer      (block $middle        (if (i32.const 0)          (then            (i32.const 6)            (else (br $outer))          )        )      )    )    ```

(assert_invalid
  (module
    (func
      (block $outer
        (block $middle
          (if (i32.const 0)
            (then)
            (else (br $outer))
          )
        )
      )
    )
  )
  "invalid branch target"
)