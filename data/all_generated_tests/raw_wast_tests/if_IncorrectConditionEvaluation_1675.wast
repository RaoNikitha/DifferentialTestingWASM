;; - **Test Description 6**: Implement a loop with an `if` condition evaluated at each iteration. The condition should include a decrement in each iteration (`i32.const 10`, then decrementing). Verify that the loop correctly branches to the `else` and exits based on the condition.

(assert_invalid
  (module (func $loop-if-condition (result i32)
    (loop $outer (result i32)
      (if (result i32)
        (i32.const 10)
        (then (i32.const 1) (i32.sub) (if (i32.eqz) (br $outer)))
        (else (i32.const 1))
      )
    )
  ))
  "type mismatch"
)