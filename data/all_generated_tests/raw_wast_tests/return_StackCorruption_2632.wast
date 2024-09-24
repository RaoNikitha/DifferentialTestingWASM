;; 1. **Test with Excessive Intermediate Values**:    - Create a function that pushes multiple values onto the operand stack before executing a `return` instruction. Verify if both implementations correctly unwind the stack to the state prior to entering the function. This ensures the stack is not corrupted by retaining excess values.

(assert_invalid
  (module
    (func $test-excessive-intermediate-values (result i32)
      (i32.const 10)
      (i32.const 20)
      (return)
      (i32.const 30)
    )
  )
  "type mismatch"
)