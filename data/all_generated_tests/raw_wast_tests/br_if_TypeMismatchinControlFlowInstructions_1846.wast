;; 7. **Test 7: Excess Operands Passed to Block**    - **Description**: Pass more operands than necessary to a block when performing a `br_if`, effectively creating type mismatches.    - **Constraint Checked**: Validate that `br_if` enforces the exact number of operands expected by the target block.    - **Relation to Type Mismatch**: Extra operands lead to stack misalignment and unexpected type mismatches.

(assert_invalid
  (module (func $excess-operands-passed-to-block
    (block (result i32)
      (drop (br_if 0 (i32.const 1) (i32.const 0) (i32.const 42))) (i32.const 1)
    )
  ))
  "type mismatch"
)