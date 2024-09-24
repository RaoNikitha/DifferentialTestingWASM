;; 1. **Test Unreachable Code After Block**:    - Design a block instruction followed by an unreachable instruction and then another valid instruction. Check to see if both implementations properly skip over the unreachable code after the block.    - **Reasoning**: This tests the handling of unreachable instructions in the CFG and whether both implementations correctly bypass them after a block exit.    - **Purpose**: Ensures that unreachable code is handled consistently in the CFG after a block.

(assert_invalid
  (module
    (func $unreachable_after_block
      (block (result i32) (i32.const 42) (drop))
      unreachable
      (i32.const 1)
    )
  )
  "unreachable code"
)