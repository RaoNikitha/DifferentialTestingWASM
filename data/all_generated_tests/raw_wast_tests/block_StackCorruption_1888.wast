;; 9. **Incorrectly Indexed Labels in Nested Blocks**:    - Description: Use multiple nested blocks with branch instructions that reference incorrect label indices.    - Constraint: Accurate label indexing relative to block nesting.    - Reasoning: Miscounting or misreferencing label indices should reveal if the operand stack is correctly balanced after branches.

(assert_invalid
  (module
    (func $nested-blocks-incorrect-labels
      (block (result i32)
        (block
          (block
            (br 3)  ; Incorrect label index
          )
        )
      )
    )
  )
  "unknown label"
)