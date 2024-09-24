;; 2. **Test Description**: Define a block with a simple `valtype?` and include nested blocks within it. Use `br_if` in the nested block that depends on a condition from the stack.    - **Constraint Checked**: Validates handling of block nesting with `valtype?` and context management for condition evaluation.    - **Relation to Condition Evaluation**: Incorrect nesting or condition evaluation might fail in branching correctly.

(assert_invalid
  (module (func $nested-block-br-if (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 1)
        (br_if 1 (i32.const 0))
        (i32.const 2)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)