;; 8. **Unreachable Followed by Valid Code**:    Add unreachable followed by valid code inside the `then` block. This checks if valid code beyond `unreachable` is never erroneously executed.    ```    if (i32.const 1) unreachable i32.const 99 i32.mul else i32.const 3 end    ```

(assert_invalid
  (module
    (func $unreachable-followed-by-valid-code
      (if (i32.const 1) (then (unreachable) (i32.const 99) (i32.mul))
       (else (i32.const 3))
      )
    )
  )
  "unreachable executed"
)