;; 1. **Test Nested Block Error Handling**:    - **Description**: Create a WebAssembly module with multiple nested blocks and a `call` instruction inside the innermost block. Verify if an invalid function index triggers an error properly when control jumps out of nested blocks.    - **Constraint**: Ensure the function index is out-of-bounds to test the error handling mechanism.    - **Relation to Mismanagement of Block Nesting**: This test checks if the implementation correctly manages nested block exit while handling invalid indices.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $nested-blocks
      (block
        (block
          (block
            (call 999 (i32.const 0))
          )
        )
      )
    )
  )
  "invalid function index"
)