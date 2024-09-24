;; 4. **Test Case: Cascade of Conditional Blocks**    - **Test Description**: Create consecutively nested blocks with conditional `br_if` instructions in each block. The conditions should variably evaluate to true and false, determining whether the branches are taken.    - **Constraint**: Verifies whether each `br_if` can successfully evaluate and transfer control flow to the appropriate outer block.    - **Relation to Mismanagement**: Incorrect branching would display as unexpected control flow behavior and operand stack management failure.

(assert_invalid
  (module
    (func $cascade-conditional-blocks
      (block (result i32)
        (block (result i32)
          (br_if 0 (i32.const 1))
          (i32.const 0)
        )
        (br_if 1 (i32.const 0))
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)