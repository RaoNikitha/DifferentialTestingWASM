;; 4. **Test Forward Branch Within Block**:    - Design a block containing a forward branch instruction (`br`) that targets an instruction within the same block.    - **Reasoning**: This tests if a forward branch within a block is correctly represented in the CFG and if the correct execution path is taken.    - **Purpose**: Validates forward branching control flow within a block.

(assert_invalid
  (module (func $invalid-br-forward-branch-block
    (block (result i32)
      (i32.const 1)
      (br 0)
      (i32.const 2)
    )
  ))
  "type mismatch"
)