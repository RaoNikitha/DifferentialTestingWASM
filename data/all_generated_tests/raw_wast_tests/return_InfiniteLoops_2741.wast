;; 10. **Loop with Span of Return Points**:     Design a loop containing multiple segments where each segment conditionally performs a `return` based on the stack’s operand values or register states. This tests the handling of `return` from within the loop, ensuring no overlooked or incorrectly targeted returns cause the function to loop infinitely.

(assert_invalid
  (module
    (func $loop-with-span-return-points (result i32)
      (local i32)
      (block (loop (br_if 1 (i32.const 0) (return)))
      (i32.const 1))
    )
  )
  "type mismatch"
)