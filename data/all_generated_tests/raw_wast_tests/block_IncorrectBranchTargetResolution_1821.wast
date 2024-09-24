;; 2. **Test Description**: Implement nested blocks where the innermost block contains a branch to a label that doesn't exist due to label index shifting issues in wizard_engine.    - **Constraint**: Ensure the branch fails correctly by raising an error for invalid label.    - **Relation**: This validates proper error handling for non-existent labels resulting from incorrect context extension.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i32)
        (br 2)
      )
    )
  ))
  "unknown label"
)