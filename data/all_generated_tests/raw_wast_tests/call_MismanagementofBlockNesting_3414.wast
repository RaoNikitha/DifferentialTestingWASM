;; 3. **Call in Nested Conditional Blocks**:    - **Description**: Use nested conditional blocks (`if` and `else`) containing calls to different functions, ensuring that the function index falls within valid ranges for both branches.    - **Constraint**: Conditionals should correctly validate and execute respective function calls without cross-branch contamination.    - **Relation to Mismanagement of Block Nesting**: Validates that conditionally nested calls are isolated and do not affect the control flow or type checking of outer blocks.

(assert_invalid
  (module
    (func $nested-conditional-call
      (if (i32.const 1) 
          (then (call 1))
          (else (call 2))
      )
    )
    (func)
    (func)
  )
  "type mismatch"
)