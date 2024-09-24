;; 4. **Test Description**: Implement a `block` with deeply nested branch instructions (`br`) that target different block depths without the correct stack elements in place for branching.    - **Constraint Checked**: Validates correct handling of branch instructions and stack height adjustments when unwinding nested blocks.    - **Relation to Stack Corruption**: Incorrect branch handling can corrupt stack content due to inappropriate popping and pushing operations during branch unwinding.

(assert_invalid
  (module (func $deeply-nested-branches
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br 2 (i32.const 42)) (i32.const 1)
        ) 
        (br 0 (i32.const 2))
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)