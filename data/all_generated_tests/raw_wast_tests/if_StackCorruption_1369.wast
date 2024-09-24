;; 10. **Test 10: Using Incorrect Block Types**    - **Description**: Define an `if` instruction with a block type that is incompatible with the operands used within either the `then` or `else` block.    - **Constraint Checked**: Proper enforcement of block type definitions and operand stack conformity.    - **Relation to Stack Corruption**: Incorrect block types lead to mismatched stack expectations, resulting in stack corruption when types do not align with actual usage in branches.

(assert_invalid
  (module
    (func $incorrect-blocktype
      (if (result i32) (i32.const 1) 
        (then (i32.const 1) (f32.const 1))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)