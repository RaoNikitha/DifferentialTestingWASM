;; 2. **Test 2: Incorrect Stack Height Management Inside Branches**    - **Description**: Use an `if` instruction where the `then` block has different stack usage from the `else` block. For example, push values in one block and do not balance them in the other.    - **Constraint Checked**: Ensuring the consistency of stack heights between `then` and `else` blocks according to the block type.    - **Relation to Stack Corruption**: Mismatching stack heights within branches can lead to stack corruption when trying to reconcile stack state post `if` execution.

(assert_invalid
  (module
    (func $incorrect-stack-height
      (if (result i32)
        (i32.const 1)
        (then (i32.const 1) (i32.const 2)) 
        (else (i32.const 3))
      )
    )
  )
  "type mismatch"
)