;; 5. **Test Name: `br_table` with Mixed Numerical and Floating Types**    - **Description**: This test includes an `if` instruction with a `br_table` that handles a mix of `i32` and `f32` types, testing the type consistency across branches and stacks.    - **Constraint Checked**: Type consistency and proper handling of mixed numerical and floating-point types.    - **Relation to Edge Case**: Ensures type safety and proper stack manipulation with mixed type operands in branching tables.

(assert_invalid
  (module (func $mixed-numerical-and-floating-br_table
    (block $block1
      (block $block2
        (br_table $block1 $block2 (if (result i32) (f32.const 0.0)
          (then (i32.const 1))
          (else (f32.const 2.0)))))
    )
  ))
  "type mismatch"
)