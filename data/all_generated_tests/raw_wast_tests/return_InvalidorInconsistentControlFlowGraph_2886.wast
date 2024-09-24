;; 5. **Test 5**: Construct a deeply recursive function with a premature `return` inside the recursion to ensure the stack unwinding is correctly handled, stopping the recursion at the correct depth and showing if the CFG is terminated properly.

(assert_invalid 
 (module 
  (func $deep-recursion-with-return (param $n i32) (result i32)
   (local $result i32)
   (if (result i32) 
    (i32.eqz (local.get $n))
    (then 
     (return (i32.const 0))
    )
   )
   (local.set $result 
    (call $deep-recursion-with-return (i32.sub (local.get $n) (i32.const 1)))
   )
   (i32.add (local.get $result) (i32.const 1))
  )
  (func (export "test") (result i32) 
   (call $deep-recursion-with-return (i32.const 10))
  )
 )
 "type mismatch"
)