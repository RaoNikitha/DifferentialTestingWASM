;; 4. **Test 4**: Develop a case where `return` is used immediately after a nested call, checking if the call stack is unwound correctly and if the `return` mistakenly matches the inner function rather than the main function context.

(assert_invalid
 (module
  (func $main (result i32)
   (call $inner)
   (return)
  )
  (func $inner
   (return (i32.const 42))
  )
  (memory 0)
 )
 "type mismatch"
)