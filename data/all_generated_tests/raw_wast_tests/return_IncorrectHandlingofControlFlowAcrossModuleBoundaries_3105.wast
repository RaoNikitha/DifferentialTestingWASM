;; 4. **Test Description**: Create a function with multiple `return` instructions at various points and import the function into another module. Call this function and verify the final state of the operand stack, ensuring the stack is correctly unwound.

(assert_invalid
  (module
    (func $multiple-returns (param i32) (result i32)
      (if (local.get 0) (then (return (i32.const 1))))
      (i32.const 2)
      (if (i32.const 1) (then (return (i32.const 3))))
      (i32.const 4)
      (return (i32.const 5))
    )
  )
  "type mismatch"
)