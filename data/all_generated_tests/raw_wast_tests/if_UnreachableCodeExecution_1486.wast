;; 7. **Unreachable Branch from If Inside Else**:    Create a test where a nested `if` inside the `else` block branches to an `unreachable`. This will test nested control flow handling.    ```    if (i32.const 0) i32.const 1 else if (i32.const 1) unreachable end end    ```

(assert_invalid
  (module
    (func
      (if (i32.const 0) (i32.const 1)
        (else
          (if (i32.const 1)
            (unreachable)
          )
        )
      )
    )
  )
  "unreachable"
)