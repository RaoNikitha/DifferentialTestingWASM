;; 8. **Test 8: Inconsistent Stack Types in Branched Outputs**    - **Description**: Use an `if` instruction where the `then` block outputs a different value type than what the `else` block is designed to handle, causing type mismatches.    - **Constraint Checked**: Consistency of value types pushed onto the stack between `then` and `else` branches.    - **Relation to Stack Corruption**: Differing types between branches can lead to corrupted stack operations when subsequent instructions expect uniform types.

(assert_invalid
  (module (func $test8
    (if (result i32 i64) (i32.const 1)
      (then (i32.const 42))
      (else (i64.const 42))
    )
  ))
  "type mismatch"
)