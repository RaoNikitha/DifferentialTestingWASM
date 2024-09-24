;; - Construct a `loop` block that includes a conditional `return` statement followed by a `call`. Ensure the operand stack's state is correctly maintained across the return, and validate the function call handling immediately after returning from the loop.

(assert_invalid
  (module
    (func $test
      (i32.const 1)
      (loop (result i32)
        (i32.eqz)
        (br_if 0)
        (return (i32.const 42))
        (call $some_function)
      )
    )
  )
  "type mismatch"
)