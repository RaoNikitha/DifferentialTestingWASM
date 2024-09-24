;; 1. **Mismatched Block Type**:    - **Test Description**: Define a block with incorrect `blocktype` that does not match the input-output stack transition required by the contained instructions.    - **Reasoning**: This test checks if the implementation correctly validates the block type and catches the misalignment between the declared and actual stack behavior, revealing potential CFG discrepancies.    - **Constraint checked**: Block Type Validation    - **Relation to CFG**: Ensures that the control flow graph manages stack transitions correctly within blocks.

(assert_invalid
  (module (func $mismatched-block-type
    (block (result i32) (f32.const 1.0) (f32.const 2.0) (f32.add))
  ))
  "type mismatch"
)