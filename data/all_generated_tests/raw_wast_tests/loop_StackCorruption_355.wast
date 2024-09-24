;; 6. **Test Loop with Function Calls**:    - Have a loop that executes multiple function calls with varying parameter counts and return types. Ensure stack consistency before and after each call.    - **Constraint**: Correct handling of stack frame setup and teardown for function calls within loops.    - **Relation to Stack Corruption**: Improper function call handling in loops can leave stack frames corrupted.

(assert_invalid
  (module (func $test_loop_function_calls
    (loop (result i32)
      (call $dummy_func_with_no_params)
      (call $dummy_func_with_params_and_result (i32.const 1) (i32.const 2))
    )
  ))
  "type mismatch"
)