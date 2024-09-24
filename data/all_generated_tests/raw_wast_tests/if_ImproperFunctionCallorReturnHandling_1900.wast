;; 1. **Test for Type Mismatch in Direct Function Call**:    - Function `A` expects an `i32` but is called with an `f32` within an `if` block.    - Checking if the conversion error is correctly captured and the call is properly blocked or leads to an improper return.

(assert_invalid
  (module
    (func $test (result i32)
      (if (result i32)
        (f32.const 1.0)
        (then (call $A (f32.const 1.0)))
      )
    )
    (func $A (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)