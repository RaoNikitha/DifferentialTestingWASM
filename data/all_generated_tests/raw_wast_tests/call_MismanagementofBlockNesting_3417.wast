;; 6. **Cross-Nested Block Function Call Errors**:    - **Description**: In deeply nested blocks, alternate between valid and invalid function calls to test consistent type and context management.    - **Constraint**: Ensure invalid calls trapped within the correct block scope and do not affect other nested layers.    - **Relation to Mismanagement of Block Nesting**: Confirms that scope management correctly isolates errors to the corresponding nested block without propagating effects.

(assert_invalid
  (module
    (func (block (block (call 0)))))
  "unknown function"
)