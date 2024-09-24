;; 10. **Test Description**: Define an `if` condition based on a call to an imported function that returns multiple values. Ensure that proper values are propagated through the stack for instructions in both the `then` and `else` branches.     - **Constraint Checked**: Correct stack height and type propagation involving multi-value returns from imported functions.     - **Test Relation**: Checks for consistency in multi-value returns when used within conditional control flows across modules.

(assert_invalid
  (module
    (import "env" "multiReturn" (func $multiReturn (result i32 i32)))
    (func $test (result i32)
      (call $multiReturn)
      (if (result i32) (then (i32.const 1)) (else (i32.const 0)))
    )
  )
  "type mismatch"
)