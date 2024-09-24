;; 10. Implement a test with a loop containing nested `if` blocks, where a `br` targets the start of the loop. Verify that the operand stack is maintained correctly after each branch, avoiding stack overflows due to repeated loop executions. ```

(assert_invalid
  (module
    (func
      (loop (result i32)
        (if (result i32)
          (i32.const 0)
          (then
            (br 1)
          )
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)