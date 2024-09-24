;; 4. **Test Description**: Nested function calls where each function call consumes and produces differing stack values.    - **Constraint Checked**: Ensures nested function calls maintain type consistency and stack integrity.    - **Improper Handling**: Detects improper stack manipulations that compromise nested function results or arguments.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $func1 (result i32)
      (call $func2)
    )
    (func $func2 (param i32) (result i32)
      (i32.const 42)
    )
    (func $nested-calls
      (i32.const 10)
      (call $func1)
      drop
    )
  )
  "type mismatch"
)