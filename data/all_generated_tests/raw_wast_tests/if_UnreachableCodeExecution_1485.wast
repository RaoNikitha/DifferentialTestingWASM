;; 6. **Unreachable in Loop Within If**:    Embed a loop containing an `unreachable` inside the `then` block of an `if`. This checks combined flow control from a loop breaking into an `if`.    ```    if (i32.const 1) loop i32.const 1 unreachable end end    ```

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then
          (loop
            (i32.const 1)
            (unreachable)
          )
        )
      )
    )
  )
  "unreachable in loop within if"
)