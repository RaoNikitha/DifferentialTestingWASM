;; 6. **Test Description 6**:    Create a scenario where a loop invokes a function that itself contains a loop with a function call. Validate that return from the innermost call reaches the correct stack depth in the outer scope.

(assert_invalid
  (module
    (func $nested-loop-function-call
      (loop (result i32)
        (call $inner-loop-function)
        (br_if 0)
      )
    )
    (func $inner-loop-function (result i32)
      (loop (result i32)
        (i32.const 1)
        (call $another-function)
        (br_if 0)
      )
    )
    (func $another-function (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)