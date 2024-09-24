;; 6. **Deeply Nested Loops with Multiple Exported Function Calls**:    - Test multiple levels of nested loops where each loop level calls different exported functions. Check for proper loop reinitialization and stack consistency at each nesting level.    - **Constraint**: Assesses correct handling and unwinding of deep nested stacks across multiple function calls.

(assert_invalid
  (module 
    (func $nested-loops
      (i32.const 10)
      (loop (result i32) 
        (i32.const 20)
        (loop (result i32)
          (call $exported_func_1)
          (br 1)
        )
        (call $exported_func_2)
        (br 1)
      )
    )
    (func $exported_func_1 (result i32)
      (i32.const 100)
    )
    (func $exported_func_2 (result i32)
      (i32.const 200)
    )
  )
  "type mismatch"
)