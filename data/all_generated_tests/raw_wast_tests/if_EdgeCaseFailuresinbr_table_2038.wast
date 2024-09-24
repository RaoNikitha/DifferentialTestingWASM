;; 9. **Test Name: `br_table` with Branch Target to Outer Block**    - **Description**: This involves an `if` whose `br_table` targets a label outside its own block, testing ability to handle external block targets correctly.    - **Constraint Checked**: Valid branch target referencing beyond immediate enclosing blocks.    - **Relation to Edge Case**: Ensures correct handling of outward block branching.

(assert_invalid
  (module (func $outer_branch_target (result i32)
    (block $outer (loop
      (if (i32.const 1)
        (then (br_table 1) (i32.const 42))
        (else (i32.const 43))
      )
    ))
  ))
  "invalid branch target"
)