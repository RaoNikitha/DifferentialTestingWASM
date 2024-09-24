;; 3. **Test Description**:    - **Scenario**: Import a function with a large number of parameters and observe the stack before and after a `call` instruction.    - **Constraint**: Verify that both implementations can handle complex and large parameter stacks without stack corruption.    - **Differential Check**: Compare the stack state and ensure correct function invocation without errors for both WASM contexts.

(assert_invalid
  (module
    (import "env" "large_params_func" (func $imported_func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
    (func $test_large_params
      (call $imported_func
        (i32.const 1) (i32.const 2) (i32.const 3) (i32.const 4) (i32.const 5)
        (i32.const 6) (i32.const 7) (i32.const 8) (i32.const 9) (i32.const 10)
        (i32.const 11) (i32.const 12) (i32.const 13) (i32.const 14) (i32.const 15)
        (i32.const 16) (i32.const 17) (i32.const 18) (i32.const 19) (i32.const 20)
      )
    )
  )
  "unknown function"
)

