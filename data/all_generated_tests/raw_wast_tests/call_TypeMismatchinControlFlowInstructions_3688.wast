;; 7. **Test Description**: Inline a function call within a `block` instruction where the block's result type is different from the function's return type.    - **Constraint**: This test ensures that the implementation checks for type consistency between inlined function calls and the block's expected result type.    - **Type Mismatch in Control Flow**: The ensuing type mismatch causes an error when the block attempts to return a value with a type different than the function's return type.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $inconsistent-block
      (block (result i64)
        (call 0)
      )
    )
    (func (result i32) (i32.const 42))
  )
  "type mismatch"
)