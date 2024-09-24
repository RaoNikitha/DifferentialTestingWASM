;; - **Test 8**: Construct a function with a conditional `return` within an `if` block that either exits the function or jumps to an `else` block to call another function. Test for proper control flow and stack unwinding.

(assert_invalid
  (module
    (func $cond_return (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then
          (return (i32.const 42))
        )
        (else
          (call $unused_func)
          (i32.const 0)
        )
      )
    )
    (func $unused_func)
  )
  "type mismatch"
)