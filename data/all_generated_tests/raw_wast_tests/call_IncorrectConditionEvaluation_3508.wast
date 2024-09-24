;; - Use a function that reads a global variable and returns its value. Call this function and ensure the global value is pushed and popped correctly from the stack and that the function type is correctly handled.

(assert_invalid
  (module
    (global $global_i32 (mut i32) (i32.const 42))
    (func $get_global (result i32) (global.get $global_i32))
    (func $call_get_global (call $get_global) (drop))
  )
  "type mismatch"
)