;; 4. **Test for Mismatched Type in Loop with Return**: Implement a function containing a loop where a `return` is used incorrectly, causing the loop to expect an operand of type `f32` when the stack has an `i32`. Check differential behavior in handling this mismatch.

(assert_invalid
  (module
    (func $type-mismatched-loop-return (result f32) 
      (f32.const 0.0)
      (loop (return (i32.const 1)))
    )
  )
  "type mismatch"
)