;; 10. **Test Description**: Construct a block with a function call that modifies the operand stack incorrectly before a conditional branch.    - **Constraint**: Ensure that function calls within blocks leave the operand stack in a valid state for subsequent branches.    - **CFG Relation**: Verifies if the CFG accurately tracks stack state transitions due to function calls within blocks.

(assert_invalid
  (module
    (func $incorrect-stack-state (result i32)
      (block (result i32)
        (call $some_func)
        (br_if 0 (i32.const 0))
        (i32.const 1)
      )
    )
    (func $some_func (unreachable))
  )
  "type mismatch"
)