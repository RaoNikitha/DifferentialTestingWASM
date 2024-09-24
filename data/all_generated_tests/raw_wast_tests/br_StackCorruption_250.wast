;; 1. **Test 1: Deeply Nested Blocks with Multiple Branches**    - A test with deeply nested `block` structures where `br` instructions are used to branch to various levels in the nesting hierarchy. This will test if the operand stack is correctly unwound and managed when branching out of multiple nested blocks.    - Constraint: Verify that labels are correctly indexed and operand stack is consistent after each branch.    - Stack Corruption Check: Ensure the stack is unwound to the right depth and no phantom data remains on the stack.

(assert_invalid
  (module (func $deep-nested-blocks-with-branches
    (block
      (block
        (block
          (block
            (block
              (br 4) 
            )
          )
        )
      )
    )
  ))
  "unknown label"
)