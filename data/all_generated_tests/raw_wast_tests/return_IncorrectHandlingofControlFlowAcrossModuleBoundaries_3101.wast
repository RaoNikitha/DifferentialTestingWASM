;; 10. **Test 10: Deeply Nested Function Calls with Return**   Construct a series of deeply nested function calls across multiple modules, where returns happen through several layers of nested calls. Check for any discrepancies in the final returned value and stack state.   **Constraint**: Ensure deeply nested returns correctly unwind intermediate stack states.   **Relation to Incorrect Handling of Control Flow**: Tests robustness in managing nested call returns and stack unwinding across multiple modules.

(assert_invalid
  (module
    (func $deeply_nested_returns (result i32)
      (call $func1)
    )
    (func $func1 (result i32)
      (call $func2)
    )
    (func $func2 (result i32)
      (call $func3)
    )
    (func $func3 (result i32)
      (call $func4)
    )
    (func $func4 (result i32)
      (return (i32.const 42))
    )
  )
  "type mismatch"
)