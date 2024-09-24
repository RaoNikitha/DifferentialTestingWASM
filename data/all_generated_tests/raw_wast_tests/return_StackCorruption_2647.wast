;; 6. **Test with Partially Consumed Stack Values**    - Create a function where only some of the stack operands are consumed before return.    - Verify the unwinding correctly leaves the remaining operands uncorrupted on the stack.    - Relates to precision in stack operand usage, ensuring no excessive pops or under-popped states occur.

(assert_invalid
  (module
    (func $partial-stack-unwind (result i32)
      (i32.const 42)
      (i32.const 100)
      (return (drop))
    )
  )
  "type mismatch"
)