;; 1. **Test Description**: Define a block with an invalid branch instruction that targets a non-existent label.    - **Constraint**: Validate that the branch targets within the block must refer to valid labels.    - **CFG Relation**: Ensures that the control flow graph correctly tracks references to valid labels, preventing references to undefined labels.

(assert_invalid
  (module (func $invalid-branch-nonexistent-label
    (block (result i32) (br 1))
  ))
  "unknown label"
)