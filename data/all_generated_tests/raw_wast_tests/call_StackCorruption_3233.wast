;; Test a function call where the function returns more values than the stack's current capacity. This tests for stack overflow and how each implementation handles pushing additional values beyond the stack limit.

(assert_invalid
  (module
    (func $test-stack-overflow
      (result i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      (i32.const 1) (i32.const 2) (i32.const 3) (i32.const 4) (i32.const 5)
      (i32.const 6) (i32.const 7) (i32.const 8) (i32.const 9) (i32.const 10)
    )
    (func (call $test-stack-overflow))
  )
  "result type mismatch"
)