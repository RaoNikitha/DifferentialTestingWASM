;; 1. Create a function call with a valid index and verify the argument and return type consistency before the call. Check if both implementations return without errors when given valid arguments and return types.

(assert_invalid
 (module
  (func $valid-func (param i32) (result i32)
   (i32.add (local.get 0) (i32.const 1))
  )
  (func
   (call 0 (i32.const 42))
  )
 )
 "type mismatch"
)