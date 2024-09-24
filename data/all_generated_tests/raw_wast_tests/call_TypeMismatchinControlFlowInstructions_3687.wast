;; 6. **Test Description**: Invoke a function that has multiple return values in a block that expects only one return type.    - **Constraint**: This test focuses on checking if multiple return values from a function are properly type-checked against the single return type expected by the enclosing block.    - **Type Mismatch in Control Flow**: The block will observe a type mismatch due to the unexpected number of return values.

(assert_invalid
  (module
    (func $multi_return_fn (result i32 i32) (i32.const 1) (i32.const 2))
    (func $type-mismatch-in-block
      (block (result i32)
        (call $multi_return_fn)
      )
    )
  )
  "type mismatch"
)