;; 1. **Nested Function Call Inside Block**:    - **Description**: Create a block that contains a nested `call` instruction to another function and ensure that it returns a specific value type. Test if the block correctly handles the function call and returns the expected output.    - **Constraint**: Verify correct nesting and return value type.    - **Improper Handling**: The function call within the block might not return the expected value due to improper handling of return types.

(assert_invalid
  (module
    (func $nested_func (result i32) (i32.const 42))
    (func (result i32)
      (block (result i32)
        (call $nested_func)
        (br 0 (i64.const 999))
      )
    )
  )
  "type mismatch"
)