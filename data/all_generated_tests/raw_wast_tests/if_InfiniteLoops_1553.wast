;; 4. Construct a loop containing an `if` statement whose `else` block initiates another loop, and the `then` block breaks the outer loop. Any error leading to incorrect break operation will lead to infinite looping:    ```    (loop $outer      (if (i32.const 1)        (then (br $outer))        (else (loop $inner (nop)))      )    )    ```    This test focuses on if-else conditions inside loops and ensures the `then` block executes a break correctly to avoid infinite loops.

(assert_invalid
  (module 
    (func $loop_if_else_break 
      (loop $outer 
        (if (i32.const 1)
          (then (br $outer))
          (else (loop $inner (nop)))
        )
      )
    )
  )
  "error leading to infinite loop due to incorrect break operation"
)