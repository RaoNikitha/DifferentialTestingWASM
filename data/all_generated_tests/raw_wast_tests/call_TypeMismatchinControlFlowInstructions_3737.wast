;; 6. **Nested Block with Different Result Types**:    - **Description**: Implement nested blocks where inner calls return types that mismatch outer block expectations.    - **Reasoning**: This ensures that nested block structures are correctly validating the types returned by called functions.    - **Constraint**: Seeks TypeMismatch errors due to incorrect type propagation across nested blocks.    - **Relation**: Validates nested control flow type integrity.

(assert_invalid
  (module
    (func $nested-blocks
      (block (result i32)
        (block
          (call $func1)
        )
        (call $func2 (i32.const 0))
      )
    )
    (func $func1 (result i64)
      (i64.const 1)
    )
    (func $func2 (param i32) (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)