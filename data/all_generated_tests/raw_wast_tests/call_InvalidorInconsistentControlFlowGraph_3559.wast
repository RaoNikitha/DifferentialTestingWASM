;; 8. **Test for Call Instruction in Unreachable Code**:    - **Description**: Place a call instruction in a block or branch that is statically known to be unreachable.    - **Constraint Checked**: Correct CFG generation for unreachable code.    - **CFG Relevance**: Ensures unreachable call instructions do not affect CFG structure.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block
        (br 1)
        (call 1 (i32.const 0))  ;; This code is unreachable
      )
    )
    (func (param i32 i32) (result i32))
  )
  "unreachable call"
)