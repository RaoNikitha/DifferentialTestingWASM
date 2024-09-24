;; 8. **Test Description**: Call a function inside a `try-catch` block where the function's returned exception type does not match the exception type expected by the catch block.    - **Constraint**: This test verifies that exception types returned by function calls within try-catch blocks are correctly matched to the expected catch block types.    - **Type Mismatch in Control Flow**: The exception type mismatch will cause the catch block to fail in handling the unexpected exception type.

(assert_invalid
  (module
    (type (func (result exnref)))
    (func $throw_exn (result exnref) (ref.null exnref))
    (func $test_method
      (try
        (do (call $throw_exn))
        (catch $e (br 0))
      )
    )
  )
  "type mismatch"
)