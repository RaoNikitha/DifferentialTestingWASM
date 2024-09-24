;; - Test 5: Create a scenario where `call_indirect` is used with an index to a function that returns more values than the stack expects to handle, leading to potential stack overflow. Check if the implementation correctly traps this condition to prevent stack corruption.

(assert_invalid
 (module
   (type (func (result i32 i32 i32)))
   (table 1 funcref)
   (elem (i32.const 0) $f)
   (func $f (result i32 i32 i32) (i32.const 42) (i32.const 42) (i32.const 42))
   (func $test
     (i32.const 0)
     (call_indirect (type 0) (i32.const 0))
   )
 )
 "stack overflow"
)