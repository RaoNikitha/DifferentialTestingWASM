;; 8. **Stack-Pushed Values Not Restored After Branch:**    - **Test Description:** Push values onto the stack in a block, branch to another block with `br`, and check if the values are correctly restored after the branch. Focus on stack consistency post-branch.    - **Constraint Tested:** Stack restoration post-branch.    - **CFG Relevance:** Incorrect stack restoration disrupts the CFG by altering expected execution states.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 42)
        (br 0)
        (i32.const 10)
      )
      (i32.const 100)
    )
  )
  "type mismatch"
)