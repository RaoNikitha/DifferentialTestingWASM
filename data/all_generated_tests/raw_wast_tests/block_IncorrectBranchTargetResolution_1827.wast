;; 8. **Test Description**: Utilize a block with multiple branch instructions where a branch targets the start of a block instead of its end due to incorrect label resolution.    - **Constraint**: Confirm the branch targets the end of the block, resuming after `end`.    - **Relation**: Ensures correct handling of forward branches to block end points.

(assert_invalid
  (module (func $test-block-branch-label-resolution
    (i32.const 0)
    (block (result i32)
      (i32.const 1)
      (br 0))
    (i32.add (i32.const 2))
  ))
  "type mismatch"
)