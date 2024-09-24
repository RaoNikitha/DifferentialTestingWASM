;; 7. **Test Description**: Create a block that includes a `select` operation with mismatched operand types.    - **Constraint**: Ensure operand type consistency in select operations within the block.    - **CFG Relation**: Tests if the CFG correctly maintains type information across `select` operations.

(assert_invalid
  (module (func $block-select-mismatch
    (block (result f32) (select (i32.const 10) (f32.const 5.5) (i32.const 1)))
  ))
  "type mismatch"
)