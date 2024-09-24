;; 7. **Test Recursive Function Return**:    - Implement a recursive function that calls itself with varied depth, manipulating the stack at each level and then returning. Compare if both implementations properly manage the stack frame for each recursive call and unwind correctly to avoid stack corruption.

(assert_invalid
 (module
  (func $recursive_return (param i32) (result i32)
   (local.get 0)
   (i32.eqz)
   (if (result i32)
    (then
     (return (i32.const 1))
    )
    (else
     (local.get 0)
     (i32.const 1)
     (i32.sub)
     (call $recursive_return)
    )
   )
  )
  (func (export "test")
   (call $recursive_return (i32.const 3))
  )
 )
 "type mismatch"
)