;; 6. **Test 6: Block Result Type Mismatch**:    - **Test Description**: Define a block with a specified return type but include a call within the block that results in an incorrect type.    - **Constraint**: Validate that the block's return types match the expected types after a call.    - **Type Mismatch**: A mismatch in block result types should trigger an error.

(assert_invalid
  (module
    (func $type-block-result-mismatch
      (block (result i32)
        (call 1 (i32.const 0))
      )
    )
    (func (result f64))
  )
  "type mismatch"
)