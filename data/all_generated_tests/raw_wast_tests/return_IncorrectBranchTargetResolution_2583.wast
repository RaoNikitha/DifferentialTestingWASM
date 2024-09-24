;; 2. **Test with Multiple Nested Functions**    - **Description**: Define multiple nested functions where `return` is used in an intermediary function. The return type should be compatible only with the outermost function.    - **Constraint**: This test ensures that `return` does not target the immediate caller function erroneously but unwinds to the correct outermost function.

(assert_invalid
  (module
    (func $inner (result i32)
      (return (i32.const 10))
    )
    (func $outer
      (i32.add (call $inner) (i32.const 5))
      (return)
    )
  )
  "type mismatch"
)