;; 1. **Test 1**:    - **Description**: Create a loop with embedded block and function calls that return multiple values. Ensure proper handling and unstacking of values.    - **Constraint**: Validation of the correct unstacking of multiple return values from function calls within a loop.    - **Stack Corruption Check**: Verify that the loop correctly manages pushed multiple return values without stack underflows.

(assert_invalid
  (module
    (func $multi_value_loop
      (i32.const 42)
      (i64.const 43)
      (f64.const 44.0)
      (loop (type (func (result i32 i64 f64)))
        (call $multi_return_func)
        (drop) (drop) (drop)
      )
    )
    (func $multi_return_func (result i32 i64 f64)
      i32.const 1
      i64.const 2
      f64.const 3.0
    )
  )
  "type mismatch"
)