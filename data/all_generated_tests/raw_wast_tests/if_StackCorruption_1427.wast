;; 8. **Test Name: Controlled Conditional Execution with Function Calls**    - **Description**: Introduce function calls within `if` blocks where the resulting stack state before and after the function calls differs significantly, ensuring conditional clauses correctly track changes.      ```wasm      (func $check (result i32) (i32.const 2))      (i32.const 1) (if (result i32) (call $check) else (block (nop)) end)      ```    - **Reasoning**: Tests whether the state of the stack post-function call is monitored and managed accurately against expectations.

(assert_invalid
  (module
    (func $check (result i32) (i32.const 2))
    (func $test
      (i32.const 1)
      (if (result i32)
        (call $check)
        else
        (block (nop))
      end)
    )
  )
  "type mismatch"
)