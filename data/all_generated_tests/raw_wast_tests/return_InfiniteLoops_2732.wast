;; 1. **Mismatched Operand Stack with Loop and Return**:    Create a function that enters a loop, pushes several operands onto the stack, and then uses a `return` that requires the operand stack to be at a different height from that of the function entry. The test checks if the stack unwinding by `return` correctly handles discarding extra operands after loop execution and prevents an infinite loop.

(assert_invalid
  (module
    (func $mismatched-operand-stack-with-loop-and-return
      (loop $L 
        (i32.const 0)
        (i32.const 1)
        (i32.add)
        (return (i32.const 1))
      )
    )
  )
  "type mismatch"
)