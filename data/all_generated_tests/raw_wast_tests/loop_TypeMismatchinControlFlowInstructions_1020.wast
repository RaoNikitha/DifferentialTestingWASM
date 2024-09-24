;; 1. Test a `loop` block where the result type does not match the expected value type. Specifically, create a loop that assumes an integer result but pushes a float onto the stack.

(assert_invalid
  (module
    (func $loop_result_type_mismatch
      (result i32)
      (loop (result i32)
        (f32.const 0.0) ; This pushes a float onto the stack
        br 0)
    )
  )
  "type mismatch"
)