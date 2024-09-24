;; 2. **Test Description**:    - **Test Name**: Conditional Branch After Function Call    - **Description**: Include a `br_if` instruction immediately after a function call. The branch should depend on a value returned by the function call.    - **Constraint Check**: Validates that the `br_if` instruction correctly handles function return values and branches appropriately.    - **Improper Handling**: Ensures that the function return value is properly used and not skipped erroneously.

(assert_invalid
  (module (func $check_function_return (result i32)
    (block (result i32)
      (call $return_i32_fn)
      (br_if 0 (i32.const 1))
      (i32.const 1)
    )
  ))
  "type mismatch"
)