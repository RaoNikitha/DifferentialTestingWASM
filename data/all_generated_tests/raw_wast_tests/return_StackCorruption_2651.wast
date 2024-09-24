;; 10. **Test with Mixed Operand Types**    - Create a function where the stack contains a mix of types before using return, including operations manipulating those mixed types.    - Ensure correct type-dependent stack management in returns.    - Verifies handling of mixed types and confirms correctness in unwinding polymorphic stacks.

(assert_invalid
  (module
    (func $test-mixed-operands-return (param i32 f32) (result i32)
      (local f64 i64)
      (i32.const 42)
      (tee_local 1 (i64.const 3))
      (tee_local 0 (f64.const 7.0))
      (return)
    )
  )
  "type mismatch"
)