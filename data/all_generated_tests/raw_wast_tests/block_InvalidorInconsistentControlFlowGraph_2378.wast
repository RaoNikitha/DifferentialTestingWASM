;; 9. **Test Conditional Branch to Block with Invalid Type**:    - Design a block with a conditional branch (`br_if`) targeting another block that has an invalid type for the branch condition.    - **Reasoning**: Tests the CFG's handling of conditional branches and whether the context extends properly for type validation.    - **Purpose**: Ensures conditional branches within blocks are accurately represented in the CFG.

(assert_invalid
  (module (func $type-conditional-branch-invalid
    (block (result i32)
      (i32.const 1)
      (block (result f32)
        (i32.const 2)
        (br_if 0 (i32.const 1))))
    (i32.const 0))
  )
  "type mismatch"
)