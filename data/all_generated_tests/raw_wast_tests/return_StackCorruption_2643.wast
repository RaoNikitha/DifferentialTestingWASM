;; 2. **Test with Multiple Return Types**    - Design a function that returns multiple types of values (e.g., int, float). Place additional operations on the stack before calling the return instruction.    - This ensures that the return correctly unwinds the stack and matches function result types.    - Relates to operand stack unwinding and verifies if all popped values and final result types match correctly.

(assert_invalid
  (module
    (func $test-multiple-return-types (result i32 f64)
      (i32.const 42) (f64.const 3.14)
      (i32.const 10) (f64.const 2.71)
      (return)
    )
  )
  "type mismatch"
)