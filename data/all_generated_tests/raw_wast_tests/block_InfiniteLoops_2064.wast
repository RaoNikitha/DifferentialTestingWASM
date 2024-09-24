;; 5. **Test Description:** Nest multiple `block` instructions with incorrect operand stack operations inside the innermost block.     - **Constraint Checked:** Ensures the proper managing of operand stack within nested blocks.     - **Infinite Loop Relation:** Incorrect stack operations might prevent the block from terminating, causing infinite loops.

(assert_invalid
  (module (func $nested-blocks-with-stack-issue
    (block (result i32)
      (block (result i32)
        (block (result i32) (i32.const 10) (i32.add))
        (i32.const 20)
      )
      (i32.const 30)
    )
  ))
  "type mismatch"
)