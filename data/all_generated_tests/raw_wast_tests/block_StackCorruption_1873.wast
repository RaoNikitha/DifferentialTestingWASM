;; 4. **Test Description**: Design a block with a complex control flow graph involving `br_table` that indexes various parts of the block and an early return to ensure the stack is properly restored in all possible branches.    - **Constraint**: Verifies comprehensive stack manipulation and restoration upon multiple branch targets.    - **Relation to Stack Corruption**: Incorrect handling of different branch targets may leave the stack in an inconsistent state.

(assert_invalid
  (module
    (func $complex-branching (result i32)
      (block (result i32) 
        (i32.const 42)
        (i32.const 1) 
        (br_table 0 0 0) 
        (return)
        (i32.const 99)
        (end)
      )
    )
  )
  "type mismatch"
)