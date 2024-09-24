;; 8. **Introduce Function Calls within Blocks**:    - Description: Call different types of functions within a block and deliberately mismatch the expected return value types from the functions.    - Constraint: Handling of function calls and stack type adherence within blocks.    - Reasoning: Different implementations may mishandle function call stack transitions, showcasing stack corruption when return values are mismatched.

(assert_invalid
  (module
    (func $func1 (result i32)
      (i32.const 42)
    )
    (func $type-function-call-mismatch (result i32)
      (block (result i32)
        (call $func1) (f64.const 3.14)
      )
    )
  )
  "type mismatch"
)