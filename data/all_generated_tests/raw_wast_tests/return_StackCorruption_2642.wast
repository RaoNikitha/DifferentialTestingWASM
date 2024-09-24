;; 1. **Test with Nested Functions**    - Create a test with a function that calls another nested function, where the inner function manipulates the stack with multiple values before returning.    - This ensures that stack unwinding correctly removes intermediate values and checks for mismatched stack values.    - Relates to how return manages stack values and catches any corruption from unwinding the outer block incorrectly.

(assert_invalid
  (module
    (func $nested-return-test
      (call $inner-func)
      (i32.const 0) ;; Placeholder instruction to misalign stack
    )
    (func $inner-func
      (i32.const 42)
      (i32.const 13)
      (return) ;; Return should correctly manage the stack    
    )
  )
  "type mismatch"
)