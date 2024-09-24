;; 7. **Test: Cross-block Branching with Incorrect Types**    - **Description**: Implement branching instructions that cross from a `then` block to an `else` block with incorrect operand types.    - **Constraint Checked**: Operand type consistency during cross-block branching.    - **CFG Relevance**: Ensures CFG correctly manages types when branches cross block boundaries.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      (if (result i32)
        (then
          (br 1 (i32.const 1))  ;; Attempt to branch incorrectly from the 'then' block
        )
        (else
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)