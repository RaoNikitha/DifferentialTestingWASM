;; 9. **Conditional Loop Restart in `if`**: Develop a test with an `if` condition inside a loop where failing the condition should restart the loop. Validate that the loop restarts correctly without causing an infinite loop.

(assert_invalid
  (module
    (func $conditional-loop-restart
      (loop $loop
        (i32.const 0)
        (if (i32.const 1)
          (then
            (br $loop)
          )
          (else
            (unreachable)
          )
        )
      )
    )
  )
  "unexpected loop restart without stack management"
)