;; 1. Create a module with a function that returns multiple values and call this function from another function. Check for proper return value handling and order when the calling function returns the results on the stack.

(assert_invalid
 (module
  (type (func (result i32 i32)))
  (func $multi-value-func (result i32 i32)
   (i32.const 1)
   (i32.const 2)
  )
  (func $test-multi-value-call (result i32 i32)
   (call $multi-value-func)
  )
 )
 "type mismatch"
)