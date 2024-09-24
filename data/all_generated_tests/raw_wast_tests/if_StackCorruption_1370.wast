;; 1. **Test Description**:    An `if` block with an integer stack size check where the `then` block pushes an integer, and the `else` block manipulates two values, ensuring balanced stack size upon `end`. Verify proper stack size management for mismatched blocktype outputs.

(assert_invalid
  (module
    (func $mismatched-stack (result i32)
      (if (result i32) 
        (then (i32.const 42))
        (else (i32.const 1) (i32.const 2) (i32.add))
      )
    )
  )
  "type mismatch"
)