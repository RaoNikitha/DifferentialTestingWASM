;; 3. **Test Case: Complex Nesting with Multiple Branches**    - **Test Description**: Design a scenario with multiple nested blocks, each containing `br`, `br_if`, and `br_table`. Ensure that the branches target various blocks at different nesting levels. Track execution flow and stack state.    - **Constraint**: Validates that branch operations target the correct block considering the nested depth accurately.    - **Relation to Mismanagement**: Failure in depth calculation and nesting would lead to unexpected execution paths and incorrect values on the stack.

(assert_invalid
  (module
    (func $complex-nesting-multiple-branches (param i32) (result i32)
      (block (result i32)
        (block
          (block
            (i32.const 1)
            (i32.const 2)
            (br_table 0 1 2 (i32.const 3))
          )
          (i32.add)
          (br_if 0 (i32.const 4))
        )
        (i32.mul)
      )
    )
  )
  "type mismatch"
)