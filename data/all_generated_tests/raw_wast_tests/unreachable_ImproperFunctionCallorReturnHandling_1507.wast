;; 8. **Test Description:**    - A function uses `unreachable` just before a `call` that should return multiple values. The test ensures that no return values are processed.    - **Constraint:** Validates interrupting the return value processing via `unreachable`.    - **Improper Function Call or Return Handling:** Checks the trap prevention on expected return values from calls.

(assert_invalid
  (module
    (func $test_unreachable_before_call
      unreachable
      (call $mock_function)
    )
    (func $mock_function (result i32 i32)
      (i32.const 1)
      (i32.const 2)
    )
  )
  "type mismatch"
)