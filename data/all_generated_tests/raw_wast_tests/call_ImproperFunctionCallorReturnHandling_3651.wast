;; 10. **Test Description**: Call a function immediately followed by an incorrect return type, to ensure appropriate handling of stack operations and return types.

(assert_invalid
  (module
    (func $incorrect-return (result i32)
      (call $invalid-return) 
      (i32.const 0)
    )
    (func $invalid-return (result i64)
      (i64.const 42)
    )
  )
  "type mismatch"
)