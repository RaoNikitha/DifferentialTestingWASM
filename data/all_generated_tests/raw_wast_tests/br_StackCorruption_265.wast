;; 6. **Test Name: Forward Branch with Incorrect Stack Unwinding**    - Write a block that requires specific stack states to maintain valid execution after `br`. Check if the stack is properly restored after a forward branch.

(assert_invalid
  (module (func $forward-branch-incorrect-unwinding (result i32)
    (block (result i32) 
      (i32.const 1) 
      (i32.const 2)
      (br 0)
      (i32.add)
    )
  ))
  "type mismatch"
)