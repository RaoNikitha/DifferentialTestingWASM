;; 2. **Test 2**: Develop nested loops where the innermost loop contains a `call` invoking a function that itself contains another nested block. Verify if function type matching within complex loops is handled correctly, focusing on the proper unwinding of the stack during `call` execution.

(assert_invalid
  (module
    (func $nested-caller
      (loop $outer
        (loop $inner
          (call $callee)
        )
      )
    )
    (func $callee
      (block
        (call $nested)
      )
    )
    (func $nested (param i32))
  )
  "type mismatch"
)