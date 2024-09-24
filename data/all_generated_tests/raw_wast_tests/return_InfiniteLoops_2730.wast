;; Design a function with an infinite loop that conditionally calls `return` based on the input. If the `return` handling has issues, the function should not exit and the loop remains infinite.

(assert_invalid
  (module
    (func $infinite_loop_conditional_return (param i32) (result i32)
      (loop
        (local.get 0)
        (i32.eqz)
        (if
          (then
            (return (i32.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)