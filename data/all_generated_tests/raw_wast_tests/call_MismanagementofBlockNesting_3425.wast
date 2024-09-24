;; 4. **Complex Nesting with Multiple Calls**:    - **Description**: Implement a WebAssembly function containing multiple nested blocks with several `call` instructions, one of which uses an invalid function index. Validate if the nesting and call order are managed properly.    - **Constraint**: Ensure the invalid function index is used in one of the deeply nested blocks.    - **Relation to Mismanagement of Block Nesting**: Verifies if nested block management remains consistent with multiple calls and an invalid index.

(assert_invalid
  (module
    (type (func))
    (func $nested-calls
      (block
        (block
          (call 1)
          (block
            (call 2)
            (block
              (call 102355)
            )
          )
        )
      )
    )
    (func (param i32) (result i32))
    (func (param i32) (result i32))
  )
  "unknown function"
)