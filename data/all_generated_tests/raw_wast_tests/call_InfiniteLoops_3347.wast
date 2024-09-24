;; 6. **Test Description**:    Implement a function that calls another with a mismatched signature in a loop. Test should demonstrate behavior differences if the signature validation fails to terminate the loop and sticks the program in an infinite loop.

(assert_invalid 
  (module 
    (func $callee (param i32) (result i32) 
      (i32.const 0) 
    )
    (func $caller 
      (loop $main 
        (call $callee (i64.const 0))
        (br $main)
      )
    )
  ) 
  "type mismatch"
)