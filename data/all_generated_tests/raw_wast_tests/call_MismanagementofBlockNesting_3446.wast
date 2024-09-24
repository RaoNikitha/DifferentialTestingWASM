;; 5. **Test 5**:    - **Description**: A function performing multiple nested blocks and calling itself recursively, altering stack values in each call.    - **Constraint Checked**: Verifies proper handling of stack growth and recursion depth limits.    - **Relation to Block Nesting**: Tests correct nesting and handling of recursive function calls within nested blocks.

(assert_invalid
  (module
    (func $recursive-nested
      (block
        (block
          (block
            (call $recursive-nested)
          )
        )
      )
    )
  )
  "stack overflow or recursion depth exceeded"
)