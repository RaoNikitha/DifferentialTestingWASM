;; 1. **Test Description 1**:    Create a function that calls another function within a loop, and ensure the called function alters the stack. Validate that after the loop, the stack contains the correct number of elements, verifying proper function call returns.

(assert_invalid
  (module
    (func $alter_stack (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add)
    (func $test_loop
      (loop
        (call $alter_stack (i32.const 0))
        br 1
      )
      drop
    )
  )
  "type mismatch"
)