;; 3. **Test Description**: Construct a nested block with multiple labels and a `br_if` that should conditionally jump to the outermost block if a stack variable is non-zero. Test with the variable set to zero.    - **Constraint Checked**: Examines correct evaluation of the condition and appropriate use of label indices.    - **Relation to Incorrect Evaluation**: Highlights if the condition is evaluated incorrectly, leading to unintended jumps.

(assert_invalid
  (module
    (func $test 
      (block
        (block
          (block 
            (i32.const 0) 
            (br_if 2) 
          )
        )
      )
    )
  )
  "type mismatch"
)