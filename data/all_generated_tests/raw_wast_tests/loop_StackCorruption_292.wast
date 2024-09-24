;; - **Test 3**: Design a loop that performs several nested function calls inside it, including functions that manipulate the stack heavily through parameter passing and return values. Branch back to the loop and verify the stack state after each call, checking for underflow or overflow conditions.

(assert_invalid
  (module
    (func $test_nested_calls
      (i32.const 1)
      (loop (result i32)
        (call $nested_func1)
        (call $nested_func2)
        (br 0)
      )
    )
    (func $nested_func1 (param i32) (result i32)
      (i32.const 2)
    )
    (func $nested_func2 (param i32) (result i32)
      (i32.const 3)
    )
  )
  "type mismatch"
)