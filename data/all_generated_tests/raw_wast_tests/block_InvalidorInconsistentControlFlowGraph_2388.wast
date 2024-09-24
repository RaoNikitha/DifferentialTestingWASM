;; 9. **Test Description**: Develop a block that contains an unresolved branch (`br`) referring to an outer block's label.    - **Constraint**: Validate that branch instructions correctly reference labels from outer blocks.    - **CFG Relation**: Tests if the CFG correctly maintains and resolves label references across nested blocks.

(assert_invalid
  (module (func $test-unresolved-branch
    (block (block (br 2)) (nop))
  ))
  "unknown label"
)