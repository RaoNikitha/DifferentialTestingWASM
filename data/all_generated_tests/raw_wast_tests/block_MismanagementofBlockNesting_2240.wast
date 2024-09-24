;; 1. **Test Case: Misinterpreted Inner Block Branching**    - **Test Description**: Create a nested block structure with an outer and inner block. Insert a `br` instruction in the inner block that targets the outer block. Ensure that another instruction follows the `br`. This test checks if the control flow correctly resumes after the `end` of the outer block, testing mismanagement in branch destination calculations.    - **Constraint**: Validates whether `br` instruction correctly escapes nested blocks and accurately resumes outside the outer block.    - **Relation to Mismanagement**: Any miscalculation in label indexing due to incorrect nesting would cause incorrect flow of control.

(assert_invalid
  (module (func $nested-block-br (result i32)
    (block (result i32)
      (block
        (br 1)
        (i32.const 1)
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)