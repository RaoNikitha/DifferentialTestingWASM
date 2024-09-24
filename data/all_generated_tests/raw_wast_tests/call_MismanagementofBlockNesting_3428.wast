;; 7. **Nested Block and Loop Combination**:    - **Description**: Develop a WebAssembly module combining nested blocks and loops with a `call` instruction to an invalid function index within the innermost loop.    - **Constraint**: The invalid function index should be within a deep loop nested inside multiple blocks.    - **Relation to Mismanagement of Block Nesting**: Validates if the combination of nested blocks and loops is correctly managed during invalid calls.

(assert_invalid
  (module
    (func $nested (block (loop (call 99))))
  )
  "unknown function"
)