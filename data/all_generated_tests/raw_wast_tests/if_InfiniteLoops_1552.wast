;; 3. Implement a loop with an `if` condition checking for a false value that has an `else` block leading to another `loop` within, where improper handling might cause the loop to keep executing unintentionally:    ```    (loop $outer      (if (i32.const 0)        (else (loop $inner                (br $outer)))      )    )    ```    This examines how the `if-else` control structure within loops manages flow control around false conditions and nested loops.

(assert_invalid
  (module
    (func $test
      (loop $outer
        (if (i32.const 0)
          (else (loop $inner
                  (br $outer)))
        )
      )
    )
  )
  "type mismatch"
)