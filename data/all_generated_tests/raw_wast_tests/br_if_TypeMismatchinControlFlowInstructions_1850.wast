;; 1. **Test Non-i32 Branch Condition**:    - **Description**: Construct a test where the condition operand for the `br_if` instruction is not of type `i32`, such as `f32` or `i64`.    - **Constraint Checked**: Ensures that only `i32` is valid for the branch condition, highlighting type enforcement.    - **Relation to Type Mismatch**: Verifies type adherence for the condition operand in control flow.

(assert_invalid
  (module
    (func $test_non_i32_branch_condition
      (block
        (br_if 0 (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)