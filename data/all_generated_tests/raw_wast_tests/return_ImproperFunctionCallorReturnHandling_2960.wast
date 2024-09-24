;; 9. Test stack unwinding with complex intermediary operations:    - Implement function calls involving complex intermediary operations and use `return` to unwind the stack.    - Verify if the stack is correctly unwound to the state expected at the entry of the function.

(assert_invalid
  (module
    (func
      (result i32)
      (i32.const 10)
      (i32.const 20)
      (i32.add)
      (f64.promote_f32 (f32.const 1.25))
      (i32.trunc_f64_s)
      (return)
    )
  )
  "type mismatch"
)