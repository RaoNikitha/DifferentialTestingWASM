;; 2. **Nested Function Calls with Mixed Return Types**:    Implement nested function calls within a function where each nested call has different return types and ensure the final return value of the outer function is correctly maintained through stack unwinding.

(assert_invalid
  (module
    (func $nested-calls-mixed-return (result i64)
      (call $func1)
      (return (i32.const 0))
    )
    (func $func1 (result i32)
      (call $func2)
    )
    (func $func2 (result i64)
      (return (i64.const 42))
    )
  )
  "type mismatch"
)