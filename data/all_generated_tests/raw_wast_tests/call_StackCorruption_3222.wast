;; 1. Test calling a function with no arguments but with multiple return values. Verify if the stack correctly handles pushing multiple return values without overflowing or misalignment.

(assert_invalid
  (module
    (func $multi-return (result i32 i32 i32)
      (i32.const 1)
      (i32.const 2)
      (i32.const 3)
    )
    (func $test-call
      (call $multi-return)
    )
  )
  "type mismatch"
)