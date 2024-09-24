;; 6. **Invalid Call with Exiting Nested Structures**:    - **Description**: Design a test where an invalid `call` instruction is placed right before an exit from deeply nested blocks using the `br` instruction.    - **Constraint**: The function index should be out-of-bounds right before an exit command.    - **Relation to Mismanagement of Block Nesting**: Ensures that exiting from nested structures doesn't obscure the error handling of invalid function calls.

(assert_invalid
  (module
    (func $invalid-nested-call
      (block $outer
        (block $inner
          (call 100)  ;; assuming 100 is out-of-bounds
          (br $inner)
        )
        (br $outer)
      )
    )
  )
  "unknown function"
)