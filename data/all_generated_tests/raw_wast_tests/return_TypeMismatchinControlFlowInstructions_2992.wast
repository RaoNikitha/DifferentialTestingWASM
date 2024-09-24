;; 1. A function returns an integer, but an intermediate block attempts to return a float, testing how each engine handles the type mismatch when unwinding the stack.

(assert_invalid
  (module
    (func $test-differential-stack-unwind (result i32)
      (i32.const 0)
      (block
        (return (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)