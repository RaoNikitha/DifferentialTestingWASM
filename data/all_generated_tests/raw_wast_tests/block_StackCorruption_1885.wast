;; 6. **Block with Overconsuming Branch**:    - Description: Use a block that contains a branch instruction consuming more values from the stack than it should.    - Constraint: Operand consumption and stack height after branching.    - Reasoning: Should illustrate differing handling of stack balance on branching, testing for stack underflows that lead to corruption.

(assert_invalid
  (module (func $block-overconsuming-branch
    (block (result i32)
      (i32.const 10)
      (br 0 (i64.const 20))
    )
  ))
  "type mismatch"
)