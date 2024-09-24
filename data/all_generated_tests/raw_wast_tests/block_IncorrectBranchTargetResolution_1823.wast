;; 4. **Test Description**: Create a block followed by another block, where the first block ends with a branch resolved to start of the first block instead of the next block in wizard_engine.    - **Constraint**: Verify that branch jumps to the correct start point of the next block.    - **Relation**: Ensures control flow instructions (`br`) are resolved to accurate entry points.

(assert_invalid
  (module (func $branch-misresolved
    (block (result i32)
      (block (br 0 (i32.const 1))
      (br 0 (i32.const 2)) (i32.const 3))
    ) 
  "type mismatch"
))